package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.PlanKongxiangMainEntity;
import com.ruanchuangsoft.platform.service.PlanKongxiangMainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;


/**
 * 空箱计划用箱单主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-01 22:13:59
 */
@Controller
@RequestMapping("plankongxiangmain")
public class PlanKongxiangMainController extends AbstractController{
	@Autowired
	private PlanKongxiangMainService planKongxiangMainService;


	@RequestMapping("/index")
	public ModelAndView index() {

		setViewname("buss/plankongxiangmain");

		ModelAndView view = getModelAndView();
		view.addObject("billid","");
//		initModelAndViewI18N(view,keys);
		return view;

	}


	@RequestMapping("/index/{id}")
	public ModelAndView indexbyid(@PathVariable("id") Long id) {

		setViewname("buss/plankongxiangmain");

		ModelAndView view = getModelAndView();
		view.addObject("billid",String.valueOf(id));
//		initModelAndViewI18N(view,keys);
		return view;

	}



	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("plankongxiangmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PlanKongxiangMainEntity> planKongxiangMainList = planKongxiangMainService.queryList(map);
		int total = planKongxiangMainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(planKongxiangMainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list/{id}")
	@RequiresPermissions("plankongxiangmain:list")
	public R listbyid(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PlanKongxiangMainEntity> planKongxiangMainList = planKongxiangMainService.queryList(map);
		int total = planKongxiangMainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(planKongxiangMainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("plankongxiangmain:info")
	public R info(@PathVariable("id") Long id){
		PlanKongxiangMainEntity planKongxiangMain = planKongxiangMainService.queryObject(id);

		return R.ok().put("planKongxiangMain", planKongxiangMain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("plankongxiangmain:save")
	public R save(@RequestBody PlanKongxiangMainEntity planKongxiangMain){
		planKongxiangMainService.save(planKongxiangMain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("plankongxiangmain:update")
	public R update(@RequestBody PlanKongxiangMainEntity planKongxiangMain){
		planKongxiangMainService.update(planKongxiangMain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("plankongxiangmain:delete")
	public R delete(@RequestBody Long[] ids){
		planKongxiangMainService.deleteBatch(ids);

		return R.ok();
	}

}
