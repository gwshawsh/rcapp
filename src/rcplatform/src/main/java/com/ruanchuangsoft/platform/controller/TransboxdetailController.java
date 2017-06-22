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

import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.service.TransboxdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输计划明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:37:11
 */
@Controller
@RequestMapping("transboxdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TransboxdetailController extends AbstractController {
	@Autowired
	private TransboxdetailService transboxdetailService;

	@RequestMapping("/transboxdetail")
	public String list(){
		return "transboxdetail/transboxdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/transboxdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transboxdetail:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				TransboxdetailEntity param = JSON.parseObject(tmpquery, TransboxdetailEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("transcompanyid", param.getTranscompanyid());
                        	        map.put("refbillno", param.getRefbillno());
                        	        map.put("refserialno", param.getRefserialno());
                        	        map.put("startplaceid1", param.getStartplaceid1());
                        	        map.put("startplaceid2", param.getStartplaceid2());
                        	        map.put("endplaceid", param.getEndplaceid());
                        	        map.put("lineid", param.getLineid());
                        	        map.put("boxno", param.getBoxno());
                        	        map.put("fengno", param.getFengno());
                        	        map.put("wendu", param.getWendu());
                        	        map.put("plantaketime", param.getPlantaketime());
                        	        map.put("realtaketime", param.getRealtaketime());
                        	        map.put("planarrvetime", param.getPlanarrvetime());
                        	        map.put("realarrvetime", param.getRealarrvetime());
                        	        map.put("carno", param.getCarno());
                        	        map.put("cartype", param.getCartype());
                        	        map.put("carenergytype", param.getCarenergytype());
                        	        map.put("driversid", param.getDriversid());
                        	        map.put("driversname", param.getDriversname());
                        	        map.put("feein", param.getFeein());
                        	        map.put("feeout", param.getFeeout());
                        	        map.put("profit", param.getProfit());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<TransboxdetailEntity> transboxdetailList = transboxdetailService.queryList(map);
		int total = transboxdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transboxdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transboxdetail:info")
	public R info(@PathVariable("id") Long id){
		TransboxdetailEntity transboxdetail = transboxdetailService.queryObject(id);

		return R.ok().put("transboxdetail", transboxdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transboxdetail:save")
	public R save(@RequestBody TransboxdetailEntity transboxdetail){
		transboxdetailService.save(transboxdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transboxdetail:update")
	public R update(@RequestBody TransboxdetailEntity transboxdetail){
		transboxdetailService.update(transboxdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transboxdetail:delete")
	public R delete(@RequestBody Long[] ids){
		transboxdetailService.deleteBatch(ids);

		return R.ok();
	}

}
