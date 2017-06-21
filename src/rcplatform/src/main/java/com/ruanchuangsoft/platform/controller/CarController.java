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

import com.ruanchuangsoft.platform.entity.CarEntity;
import com.ruanchuangsoft.platform.service.CarService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 车辆管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
@Controller
@RequestMapping("car")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class CarController extends AbstractController {
	@Autowired
	private CarService carService;

	@RequestMapping("/car")
	public String list(){
		return "car/car";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/car");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("car:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<CarEntity> carList = carService.queryList(map);
		int total = carService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(carList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("car:info")
	public R info(@PathVariable("id") Long id){
		CarEntity car = carService.queryObject(id);

		return R.ok().put("car", car);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("car:save")
	public R save(@RequestBody CarEntity car){
		carService.save(car);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("car:update")
	public R update(@RequestBody CarEntity car){
		carService.update(car);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("car:delete")
	public R delete(@RequestBody Long[] ids){
		carService.deleteBatch(ids);

		return R.ok();
	}

}
