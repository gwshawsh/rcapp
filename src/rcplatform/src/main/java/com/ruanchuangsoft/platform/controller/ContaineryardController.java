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

import com.ruanchuangsoft.platform.entity.ContaineryardEntity;
import com.ruanchuangsoft.platform.service.ContaineryardService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 堆场管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 19:54:17
 */
@Controller
@RequestMapping("containeryard")
public class ContaineryardController extends AbstractController {
	@Autowired
	private ContaineryardService containeryardService;

	@RequestMapping("/containeryard")
	public String list(){
		return "containeryard/containeryard";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/containeryard");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("containeryard:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<ContaineryardEntity> containeryardList = containeryardService.queryList(map);
		int total = containeryardService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(containeryardList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("containeryard:info")
	public R info(@PathVariable("id") Long id){
		ContaineryardEntity containeryard = containeryardService.queryObject(id);

		return R.ok().put("containeryard", containeryard);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("containeryard:save")
	public R save(@RequestBody ContaineryardEntity containeryard){
		containeryardService.save(containeryard);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("containeryard:update")
	public R update(@RequestBody ContaineryardEntity containeryard){
		containeryardService.update(containeryard);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("containeryard:delete")
	public R delete(@RequestBody Long[] ids){
		containeryardService.deleteBatch(ids);

		return R.ok();
	}

}
