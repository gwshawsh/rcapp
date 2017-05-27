package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.EmptymainEntity;
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
public class EmptymainController extends AbstractController {
	@Autowired
	private EmptymainService emptymainService;

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
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

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

}
