package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.RentcontractmainEntity;
import com.ruanchuangsoft.platform.service.RentcontractmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 租赁合同
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:27:17
 */
@Controller
@RequestMapping("rentcontractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RentcontractmainController extends AbstractController {
	@Autowired
	private RentcontractmainService rentcontractmainService;

	@RequestMapping("/rentcontractmain")
	public String list(){
		return "rentcontractmain/rentcontractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/rentcontractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("rentcontractmain:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				RentcontractmainEntity param = JSON.parseObject(tmpquery, RentcontractmainEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("orgid", param.getOrgid());
                        	        map.put("linkman", param.getLinkman());
                        	        map.put("mobile", param.getMobile());
                        	        map.put("paytype", param.getPaytype());
                        	        map.put("paycircle", param.getPaycircle());
                        	        map.put("boctid", param.getBoctid());
                        	        map.put("rate", param.getRate());
                        	        map.put("taxrate", param.getTaxrate());
                        	        map.put("rentprice", param.getRentprice());
                        	        map.put("rentmonth", param.getRentmonth());
                        	        map.put("renttotal", param.getRenttotal());
                        	        map.put("bgndate", param.getBgndate());
                        	        map.put("enddate", param.getEnddate());
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
		List<RentcontractmainEntity> rentcontractmainList = rentcontractmainService.queryList(map);
		int total = rentcontractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(rentcontractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("rentcontractmain:info")
	public R info(@PathVariable("id") Long id){
		RentcontractmainEntity rentcontractmain = rentcontractmainService.queryObject(id);

		return R.ok().put("rentcontractmain", rentcontractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("rentcontractmain:save")
	public R save(@RequestBody RentcontractmainEntity rentcontractmain){
		rentcontractmainService.save(rentcontractmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("rentcontractmain:update")
	public R update(@RequestBody RentcontractmainEntity rentcontractmain){
		rentcontractmainService.update(rentcontractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("rentcontractmain:delete")
	public R delete(@RequestBody Long[] ids){
		rentcontractmainService.deleteBatch(ids);

		return R.ok();
	}

}
