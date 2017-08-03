package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TakeboxdetailService;
import com.ruanchuangsoft.platform.service.TakeboxmainService;
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

import com.ruanchuangsoft.platform.service.EmptymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 空箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
@Controller
@RequestMapping("emptymain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class EmptymainController extends AbstractController {
	@Autowired
	private EmptymainService emptymainService;

	@Autowired
	private TakeboxmainService takeboxmainService;

	@Autowired
	private TransboxmainService transboxmainService;

	@RequestMapping("/emptymain")
	public String list(){
		return "emptymain/emptymain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/emptymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("emptymain:list")
	public R list(Integer page, Integer limit,String query){

		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		if(query!=null&&query.length()>0){
			try {
				String tmpquery =query.replaceAll("&quot;","\"");
				EmptymainEntity param = JSON.parseObject(tmpquery, EmptymainEntity.class);
				map.put("billno", param.getBillno());
				map.put("ladingcode", param.getLadingcode());
			}catch(Exception e){
				e.printStackTrace();
			}

		}

		//查询列表数据
		List<EmptymainEntity> emptymainList = emptymainService.queryList(map);
		int total = emptymainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(emptymainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("emptymain:info")
	public R info(@PathVariable("id") Long id){
		EmptymainEntity emptymain = emptymainService.queryObject(id);

		return R.ok().put("emptymain", emptymain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("emptymain:save")
	public R save(@RequestBody EmptymainEntity emptymain){
		if(emptymain.getBillno().equalsIgnoreCase("*")) {
			String billno = getBillNo("EM");
			emptymain.setBillno(billno);
		}
		emptymainService.save(emptymain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("emptymain:update")
	public R update(@RequestBody EmptymainEntity emptymain){
		emptymainService.update(emptymain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("emptymain:delete")
	public R delete(@RequestBody Long[] ids){
		emptymainService.deleteBatch(ids);

		return R.ok();
	}

	/**
	 * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
	 */
	@ResponseBody
	@RequestMapping("/audit")
	@RequiresPermissions("emptymain:audit")
	public R audit(@RequestBody  EmptymainEntity pemptymain){

			EmptymainEntity emptymain=emptymainService.queryObject(pemptymain.getId());
			if(emptymain!=null){
				if(emptymain.getBillstatus().equals(EmptyBillStatus.AUDIT)){
					return R.error(1,"单据已经审核,不能重复审核");
				}
				emptymain.setBillstatus(EmptyBillStatus.AUDIT);
				emptymain.setAccdate(new Date());
				emptymain.setAccuser(ShiroUtils.getUserId());
				emptymain.setUptdate(new Date());
				emptymainService.update(emptymain);



				//判断是否需要放箱,如果是则生成放箱单,如果不是,则判断是否需要生成运输单
				if(emptymain.getIstakebox()==1) {
					TakeboxmainEntity takeboxmainEntity = new TakeboxmainEntity();
					String billno = getBillNo("TB");
					takeboxmainEntity.setBillno(billno);
					takeboxmainEntity.setRefbillno(emptymain.getBillno());
					takeboxmainEntity.setRefbilltype(TranBillType.EMPTYBILL);
					takeboxmainEntity.setOrgid(emptymain.getOrgid());
					takeboxmainEntity.setLadingcode(emptymain.getLadingcode());
					takeboxmainEntity.setShipname(emptymain.getShipname());
					takeboxmainEntity.setFlight(emptymain.getFlight());
					takeboxmainEntity.setPortid(emptymain.getPortid());
					takeboxmainEntity.setBoxqty(emptymain.getBoxqty());
					takeboxmainEntity.setBoxtype(emptymain.getBoxtype());
					takeboxmainEntity.setTakeboxplaceid(emptymain.getTakeboxplaceid());
					takeboxmainEntity.setEndplaceid(emptymain.getEndplaceid());
					takeboxmainEntity.setBgnplanarrtime(emptymain.getPlanarrdatetime());
					takeboxmainEntity.setEndplanarrtime(emptymain.getPlanarrdatetime());
					takeboxmainEntity.setBillstatus(BillStatus.NEW);
					takeboxmainEntity.setMakedate(new Date());
					takeboxmainEntity.setMakeuser(ShiroUtils.getUserId());
					takeboxmainEntity.setUptdate(new Date());

					List<TakeboxdetailEntity> details = new ArrayList<>();

					//创建明细
					for (int i = 0; i < emptymain.getBoxqty(); i++) {
						TakeboxdetailEntity takeboxdetailEntity = new TakeboxdetailEntity();
						takeboxdetailEntity.setBillno(billno);
						takeboxdetailEntity.setSerialno((long) i);
						takeboxdetailEntity.setBoxno("");
//						takeboxdetailEntity.setStartplaceid1(emptymain.getTakeboxplaceid());
//						takeboxdetailEntity.setStartplaceid2(emptymain.getTakeboxplaceid());
						takeboxdetailEntity.setEndplaceid(emptymain.getEndplaceid());
						takeboxdetailEntity.setUptdate(new Date());
						details.add(takeboxdetailEntity);

					}
					takeboxmainEntity.setDetails(details);

					takeboxmainService.save(takeboxmainEntity);
				}
				//判断是否直接生成运输单
				else if(emptymain.getIstrans()==1){
					//生成运输计划主表
					TransboxmainEntity transboxmainEntity=new TransboxmainEntity();
					String billno=getBillNo("TS");
					transboxmainEntity.setBillno(billno);
					transboxmainEntity.setRefbillno(emptymain.getBillno());
					transboxmainEntity.setRefbilltype(1);
					transboxmainEntity.setEndplaceid(emptymain.getEndplaceid());
					transboxmainEntity.setLadingcode(emptymain.getLadingcode());
					transboxmainEntity.setShipname(emptymain.getShipname());
					transboxmainEntity.setFlight(emptymain.getFlight());
					transboxmainEntity.setPortid(emptymain.getPortid());
					transboxmainEntity.setBoxqty(emptymain.getBoxqty());
					transboxmainEntity.setBoxtype(emptymain.getBoxtype());
					transboxmainEntity.setTakeboxplaceid(emptymain.getTakeboxplaceid());
					transboxmainEntity.setBgnplanarrtime(emptymain.getPlanarrdatetime());
					transboxmainEntity.setEndplanarrtime(emptymain.getPlanarrdatetime());
					transboxmainEntity.setBillstatus(BillStatus.NEW);
					transboxmainEntity.setMakedate(new Date());
					transboxmainEntity.setMakeuser(String.valueOf(ShiroUtils.getUserId()));
					transboxmainEntity.setUptdate(new Date());
					List<TransboxdetailEntity> lstTransDetail=new ArrayList<>();
					for(int i=0;i<emptymain.getBoxqty();i++){

						TransboxdetailEntity tsDetail=new TransboxdetailEntity();
						tsDetail.setBillno(billno);
						tsDetail.setBillno(billno);
						tsDetail.setSerialno((long) i);
						tsDetail.setBoxno("");
						tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
						tsDetail.setStartplaceid1(emptymain.getTakeboxplaceid());
						tsDetail.setStartplaceid2(emptymain.getTakeboxplaceid());
						tsDetail.setEndplaceid(emptymain.getEndplaceid());
						tsDetail.setUptdate(new Date());
						lstTransDetail.add(tsDetail);

					}
					transboxmainEntity.setDetails(lstTransDetail);
					transboxmainService.save(transboxmainEntity);


				}
			}





		return R.ok();
	}




}
