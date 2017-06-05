package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.enums.TakeboxBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TakeboxdetailService;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;
import com.ruanchuangsoft.platform.service.TakeboxmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 放箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 21:36:50
 */
@Controller
@RequestMapping("takeboxmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TakeboxmainController extends AbstractController {
	@Autowired
	private TakeboxmainService takeboxmainService;

	@Autowired
	private TakeboxdetailService takeboxdetailService;

	@Autowired
	private TransboxmainService transboxmainService;


	@RequestMapping("/takeboxmain")
	public String list(){
		return "takeboxmain/takeboxmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/takeboxmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("takeboxmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TakeboxmainEntity> takeboxmainList = takeboxmainService.queryList(map);
		int total = takeboxmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(takeboxmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/listdetail")
	@RequiresPermissions("takeboxmain:list")
	public R listdetail(Long formid,Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("formid",formid);
		//查询列表数据
		List<TakeboxdetailEntity> takeboxdetailList = takeboxdetailService.queryList(map);
		int total = takeboxdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(takeboxdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("takeboxmain:info")
	public R info(@PathVariable("id") Long id){
		TakeboxmainEntity takeboxmain = takeboxmainService.queryObject(id);

		Map<String, Object> map = new HashMap<>();
		map.put("formid",id);
		//查询列表数据
		List<TakeboxdetailEntity> takeboxdetailList = takeboxdetailService.queryList(map);
		takeboxmain.setDetails(takeboxdetailList);
		return R.ok().put("takeboxmain", takeboxmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("takeboxmain:save")
	public R save(@RequestBody TakeboxmainEntity takeboxmain){
		if(takeboxmain.getBillno().equals("*")){
			String billno=getBillNo("TB");
			takeboxmain.setBillno(billno);
			if(takeboxmain.getDetails()!=null&&takeboxmain.getDetails().size()>0){
				for(TakeboxdetailEntity item:takeboxmain.getDetails()){
					item.setBillno(billno);
					item.setPlanarrvetime(takeboxmain.getBgnplanarrtime());

				}
			}
		}
		takeboxmainService.save(takeboxmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("takeboxmain:update")
	public R update(@RequestBody TakeboxmainEntity takeboxmain){
		takeboxmainService.update(takeboxmain);

		return R.ok();
	}

	/**
	* 审核,生成运输单据
	*/
	@ResponseBody
	@RequestMapping("/shenhe")
	@RequiresPermissions("takeboxmain:shenhe")
	public R accbill(@RequestBody  Long[] ids){
		for(long id:ids) {
			TakeboxmainEntity takeboxmainEntity=takeboxmainService.queryObject(id);
			if(takeboxmainEntity!=null) {
				if(takeboxmainEntity.getBillstatus().equals(TakeboxBillStatus.AUDIT)){
					return R.error(1,"单据已经审核,不能重复审核");
				}
				takeboxmainEntity.setBillstatus(TakeboxBillStatus.AUDIT);
				takeboxmainEntity.setAccdate(new Date());
				takeboxmainEntity.setAccuser(ShiroUtils.getUserName());
				takeboxmainService.update(takeboxmainEntity);
				
				//查询放箱明细,一个放箱计划可能会安排不同的运输车队
				Map<String, Object> map = new HashMap<>();
				map.put("formid",takeboxmainEntity.getId());
				//查询列表数据
				List<TakeboxdetailEntity> takeboxdetailList = takeboxdetailService.queryList(map);

				//根据放箱明细中记录的运输车队,生成运输计划,一个车队一个单据
				Map<Long,List<TakeboxdetailEntity>> tmpTransCompanyid=new HashMap<>();
				for(TakeboxdetailEntity detail:takeboxdetailList){
					long tcid=detail.getTranscompanyid();
					if(!tmpTransCompanyid.containsKey(tcid)){
						List<TakeboxdetailEntity> lstDetail=new ArrayList<>();
						lstDetail.add(detail);
						tmpTransCompanyid.put(tcid,lstDetail);
					}else{
						List<TakeboxdetailEntity> lstDetail=tmpTransCompanyid.get(tcid);
						lstDetail.add(detail);
					}
				}

				for(Long tcid:tmpTransCompanyid.keySet()){
					//生成运输计划主表
					TransboxmainEntity transboxmainEntity=new TransboxmainEntity();
					String billno=getBillNo("TS");
					transboxmainEntity.setBillno(billno);
					transboxmainEntity.setReftakebillno(takeboxmainEntity.getRefbillno());
					transboxmainEntity.setRefbillno(takeboxmainEntity.getBillno());
					transboxmainEntity.setRefbilltype(takeboxmainEntity.getRefbilltype());
					transboxmainEntity.setEndplaceid(takeboxmainEntity.getEndplaceid());
					transboxmainEntity.setTranscompanyid(tcid);
					transboxmainEntity.setLadingcode(takeboxmainEntity.getLadingcode());
					transboxmainEntity.setShipname(takeboxmainEntity.getShipname());
					transboxmainEntity.setFlight(takeboxmainEntity.getFlight());
					transboxmainEntity.setPortid(takeboxmainEntity.getPortid());
					transboxmainEntity.setBoxqty(takeboxmainEntity.getBoxqty());
					transboxmainEntity.setBoxtype(takeboxmainEntity.getBoxtype());
					transboxmainEntity.setTakeboxplaceid(takeboxmainEntity.getTakeboxplaceid());
					transboxmainEntity.setBgnplanarrtime(takeboxmainEntity.getBgnplanarrtime());
					transboxmainEntity.setEndplanarrtime(takeboxmainEntity.getEndplanarrtime());
					transboxmainEntity.setMakedate(new Date());
					transboxmainEntity.setMakeuser(ShiroUtils.getUserName());

					List<TransboxdetailEntity> lstTransDetail=new ArrayList<>();
					List<TakeboxdetailEntity> lstDetail=tmpTransCompanyid.get(tcid);
					for(int i=0;i<lstDetail.size();i++){
						TakeboxdetailEntity item=lstDetail.get(i);

						TransboxdetailEntity tsDetail=new TransboxdetailEntity();
						tsDetail.setBillno(billno);
						tsDetail.setPlanarrvetime(item.getPlanarrvetime());
						tsDetail.setStartplaceid1(item.getStartplaceid1());
						tsDetail.setStartplaceid2(item.getStartplaceid2());
						tsDetail.setEndplaceid(item.getEndplaceid());
						tsDetail.setSerialno((long)i);

						lstTransDetail.add(tsDetail);

					}
					transboxmainEntity.setDetails(lstTransDetail);
					transboxmainService.save(transboxmainEntity);

				}




			}
		}
		return R.ok();
	}



	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("takeboxmain:delete")
	public R delete(@RequestBody Long[] ids){
		takeboxmainService.deleteBatch(ids);

		return R.ok();
	}

}
