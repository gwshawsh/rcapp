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

import com.ruanchuangsoft.platform.entity.EnumtableEntity;
import com.ruanchuangsoft.platform.service.EnumtableService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 枚举表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:00:00
 */
@Controller
@RequestMapping("enumtable")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class EnumtableController extends AbstractController {
	@Autowired
	private EnumtableService enumtableService;

	@RequestMapping("/enumtable")
	public String list(){
		return "enumtable/enumtable";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("sys/enumtable");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<EnumtableEntity> enumtableList = enumtableService.queryList(map);
		int total = enumtableService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(enumtableList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 返回枚举类型的值
	 */
	@ResponseBody
	@RequestMapping("/listone")
	public R listone(String enumid,Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("enumtype", enumid);
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<EnumtableEntity> enumtableList = enumtableService.queryList(map);
		int total = enumtableService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(enumtableList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id){
		EnumtableEntity enumtable = enumtableService.queryObject(id);

		return R.ok().put("enumtable", enumtable);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("enumtable:save")
	public R save(@RequestBody EnumtableEntity enumtable){
		enumtableService.save(enumtable);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("enumtable:update")
	public R update(@RequestBody EnumtableEntity enumtable){
		enumtableService.update(enumtable);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("enumtable:delete")
	public R delete(@RequestBody Long[] ids){
		enumtableService.deleteBatch(ids);

		return R.ok();
	}

}
