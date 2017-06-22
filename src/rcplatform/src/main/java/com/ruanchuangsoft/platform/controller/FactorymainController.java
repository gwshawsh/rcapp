package com.ruanchuangsoft.platform.controller;

import java.util.*;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.LeaveportmainEntity;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
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

import com.ruanchuangsoft.platform.entity.FactorymainEntity;
import com.ruanchuangsoft.platform.service.FactorymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 门点计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
@Controller
@RequestMapping("factorymain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class FactorymainController extends AbstractController {
	@Autowired
	private FactorymainService factorymainService;

	@Autowired
	private TransboxmainService transboxmainService;

	@RequestMapping("/factorymain")
	public String list(){
		return "factorymain/factorymain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/factorymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("factorymain:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				FactorymainEntity param = JSON.parseObject(tmpquery, FactorymainEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("orgid", param.getOrgid());
                        	        map.put("ladingcode", param.getLadingcode());
                        	        map.put("shipname", param.getShipname());
                        	        map.put("flight", param.getFlight());
                        	        map.put("portid", param.getPortid());
                        	        map.put("boxqty", param.getBoxqty());
                        	        map.put("boxtype", param.getBoxtype());
                        	        map.put("takeboxplaceid", param.getTakeboxplaceid());
                        	        map.put("endplaceid", param.getEndplaceid());
                        	        map.put("backplaceid", param.getBackplaceid());
                        	        map.put("bgnshipdatetime", param.getBgnshipdatetime());
                        	        map.put("endshipdatetime", param.getEndshipdatetime());
                        	        map.put("bgnplanarrtime", param.getBgnplanarrtime());
                        	        map.put("endplanarrtime", param.getEndplanarrtime());
                        	        map.put("remark", param.getRemark());
                        	        map.put("billstatus", param.getBillstatus());
                        	        map.put("makeuser", param.getMakeuser());
                        	        map.put("makedate", param.getMakedate());
                        	        map.put("accuser", param.getAccuser());
                        	        map.put("accdate", param.getAccdate());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<FactorymainEntity> factorymainList = factorymainService.queryList(map);
		int total = factorymainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(factorymainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("factorymain:info")
	public R info(@PathVariable("id") Long id){
		FactorymainEntity factorymain = factorymainService.queryObject(id);

		return R.ok().put("factorymain", factorymain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("factorymain:save")
	public R save(@RequestBody FactorymainEntity factorymain){
		factorymainService.save(factorymain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("factorymain:update")
	public R update(@RequestBody FactorymainEntity factorymain){
		factorymainService.update(factorymain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("factorymain:delete")
	public R delete(@RequestBody Long[] ids){
		factorymainService.deleteBatch(ids);

		return R.ok();
	}



	/**
	 * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
	 */
	@ResponseBody
	@RequestMapping("/audit")
	@RequiresPermissions("factorymain:audit")
	public R audit(@RequestBody Long[] ids) {
		for (long id : ids) {
			FactorymainEntity factorymainEntity = factorymainService.queryObject(id);
			if (factorymainEntity != null) {
				if (factorymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
					return R.error(1, "单据已经审核,不能重复审核");
				}
				factorymainEntity.setBillstatus(EmptyBillStatus.AUDIT);
				factorymainEntity.setAccdate(new Date());
				factorymainEntity.setAccuser(ShiroUtils.getUserName());
				factorymainEntity.setUptdate(new Date());
				factorymainService.update(factorymainEntity);


				//生成运输计划主表
				TransboxmainEntity transboxmainEntity = new TransboxmainEntity();
				String billno = getBillNo("TS");
				transboxmainEntity.setBillno(billno);
				transboxmainEntity.setRefbillno(factorymainEntity.getBillno());
				transboxmainEntity.setRefbilltype(TranBillType.FACTORYBILL);
				transboxmainEntity.setEndplaceid(factorymainEntity.getEndplaceid());
				transboxmainEntity.setLadingcode("");
				transboxmainEntity.setShipname("");
				transboxmainEntity.setFlight("");
				transboxmainEntity.setPortid(factorymainEntity.getPortid());
				transboxmainEntity.setBoxqty(factorymainEntity.getBoxqty());
				transboxmainEntity.setBoxtype(factorymainEntity.getBoxtype());
				transboxmainEntity.setTakeboxplaceid(factorymainEntity.getTakeboxplaceid());
				transboxmainEntity.setBgnplanarrtime(factorymainEntity.getBgnplanarrtime());
				transboxmainEntity.setEndplanarrtime(factorymainEntity.getEndplanarrtime());
				transboxmainEntity.setMakedate(new Date());
				transboxmainEntity.setMakeuser(ShiroUtils.getUserName());
				transboxmainEntity.setUptdate(new Date());
				List<TransboxdetailEntity> lstTransDetail = new ArrayList<>();
				for (int i = 0; i < factorymainEntity.getBoxqty(); i++) {

					TransboxdetailEntity tsDetail = new TransboxdetailEntity();
					tsDetail.setBillno(billno);
					tsDetail.setBillno(billno);
					tsDetail.setSerialno((long) i);
					tsDetail.setBoxno("");
					tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
					tsDetail.setStartplaceid1(factorymainEntity.getTakeboxplaceid());
					tsDetail.setStartplaceid2(factorymainEntity.getTakeboxplaceid());
					tsDetail.setEndplaceid(factorymainEntity.getEndplaceid());
					tsDetail.setUptdate(new Date());
					lstTransDetail.add(tsDetail);

				}
				transboxmainEntity.setDetails(lstTransDetail);
				transboxmainService.save(transboxmainEntity);


			}
		}


		return R.ok();
	}


	/**
	 * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
	 */
	@ResponseBody
	@RequestMapping("/unaudit")
	@RequiresPermissions("factorymain:audit")
	public R unaudit(@RequestBody Long[] ids) {
		for (long id : ids) {
			FactorymainEntity factorymainEntity = factorymainService.queryObject(id);
			if (factorymainEntity != null) {
				if (factorymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
					return R.error(1, "单据已经审核,不能重复审核");
				}
				factorymainEntity.setBillstatus(EmptyBillStatus.NEW);
				factorymainEntity.setAccdate(new Date());
				factorymainEntity.setAccuser("");
				factorymainEntity.setUptdate(new Date());
				factorymainService.update(factorymainEntity);

				//查找已经生成的运输任务
				//transboxmainService.queryObject()
				Map<String, Object> map = new HashMap<>();

				map.put("refbillno", factorymainEntity.getBillno());
				map.put("refbilltype",TranBillType.HEAVYBILL);
				List<TransboxmainEntity> tmpListTransbox= transboxmainService.queryList(map);
				if(tmpListTransbox!=null&&tmpListTransbox.size()>0) {
					for(TransboxmainEntity item:tmpListTransbox) {
						transboxmainService.delete(item.getId());
					}
				}


			}
		}


		return R.ok();
	}

}
