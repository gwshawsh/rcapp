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

import com.ruanchuangsoft.platform.entity.DriversEntity;
import com.ruanchuangsoft.platform.service.DriversService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 司机管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
@Controller
@RequestMapping("drivers")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class DriversController extends AbstractController {
	@Autowired
	private DriversService driversService;

	@RequestMapping("/drivers")
	public String list(){
		return "drivers/drivers";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("drivers/drivers");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("drivers:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<DriversEntity> driversList = driversService.queryList(map);
		int total = driversService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(driversList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("drivers:info")
	public R info(@PathVariable("id") Long id){
		DriversEntity drivers = driversService.queryObject(id);

		return R.ok().put("drivers", drivers);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("drivers:save")
	public R save(@RequestBody DriversEntity drivers){
		driversService.save(drivers);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("drivers:update")
	public R update(@RequestBody DriversEntity drivers){
		driversService.update(drivers);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("drivers:delete")
	public R delete(@RequestBody Long[] ids){
		driversService.deleteBatch(ids);

		return R.ok();
	}

}
