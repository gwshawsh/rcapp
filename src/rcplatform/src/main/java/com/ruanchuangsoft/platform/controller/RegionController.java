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

import com.ruanchuangsoft.platform.entity.RegionEntity;
import com.ruanchuangsoft.platform.service.RegionService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 区域管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
@Controller
@RequestMapping("region")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RegionController extends AbstractController {
	@Autowired
	private RegionService regionService;

	@RequestMapping("/region")
	public String list(){
		return "region/region";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/region");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("region:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<RegionEntity> regionList = regionService.queryList(map);
		int total = regionService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(regionList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("region:info")
	public R info(@PathVariable("id") Long id){
		RegionEntity region = regionService.queryObject(id);

		return R.ok().put("region", region);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("region:save")
	public R save(@RequestBody RegionEntity region){
		regionService.save(region);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("region:update")
	public R update(@RequestBody RegionEntity region){
		regionService.update(region);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("region:delete")
	public R delete(@RequestBody Long[] ids){
		regionService.deleteBatch(ids);

		return R.ok();
	}

}
