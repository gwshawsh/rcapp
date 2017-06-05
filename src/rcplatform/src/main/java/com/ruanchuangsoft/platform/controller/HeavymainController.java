package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.HeavymainEntity;
import com.ruanchuangsoft.platform.service.HeavymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 重箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
@Controller
@RequestMapping("heavymain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class HeavymainController extends AbstractController {
	@Autowired
	private HeavymainService heavymainService;

	@RequestMapping("/heavymain")
	public String list(){
		return "heavymain/heavymain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/heavymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("heavymain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<HeavymainEntity> heavymainList = heavymainService.queryList(map);
		int total = heavymainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(heavymainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("heavymain:info")
	public R info(@PathVariable("id") Long id){
		HeavymainEntity heavymain = heavymainService.queryObject(id);

		return R.ok().put("heavymain", heavymain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("heavymain:save")
	public R save(@RequestBody HeavymainEntity heavymain){
		heavymainService.save(heavymain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("heavymain:update")
	public R update(@RequestBody HeavymainEntity heavymain){
		heavymainService.update(heavymain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("heavymain:delete")
	public R delete(@RequestBody Long[] ids){
		heavymainService.deleteBatch(ids);

		return R.ok();
	}

}