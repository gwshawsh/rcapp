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

import com.ruanchuangsoft.platform.entity.PreemptymainEntity;
import com.ruanchuangsoft.platform.service.PreemptymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 预约用箱
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
@Controller
@RequestMapping("preemptymain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PreemptymainController extends AbstractController {
	@Autowired
	private PreemptymainService preemptymainService;

	@RequestMapping("/preemptymain")
	public String list(){
		return "preemptymain/preemptymain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {
        setViewname("buss/preemptymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("preemptymain:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				PreemptymainEntity param = JSON.parseObject(tmpquery, PreemptymainEntity.class);
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
                        	        map.put("bgntakedate", param.getBgntakedate());
                        	        map.put("endtakedate", param.getEndtakedate());
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
		List<PreemptymainEntity> preemptymainList = preemptymainService.queryList(map);
		int total = preemptymainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(preemptymainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("preemptymain:info")
	public R info(@PathVariable("id") Long id){
		PreemptymainEntity preemptymain = preemptymainService.queryObject(id);

		return R.ok().put("preemptymain", preemptymain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("preemptymain:save")
	public R save(@RequestBody PreemptymainEntity preemptymain){
		preemptymainService.save(preemptymain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("preemptymain:update")
	public R update(@RequestBody PreemptymainEntity preemptymain){
		preemptymainService.update(preemptymain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("preemptymain:delete")
	public R delete(@RequestBody Long[] ids){
		preemptymainService.deleteBatch(ids);

		return R.ok();
	}

}
