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

import com.ruanchuangsoft.platform.entity.ShipEntity;
import com.ruanchuangsoft.platform.service.ShipService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 船舶管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
@Controller
@RequestMapping("ship")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ShipController extends AbstractController {
	@Autowired
	private ShipService shipService;

	@RequestMapping("/ship")
	public String list(){
		return "ship/ship";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/ship");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("ship:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<ShipEntity> shipList = shipService.queryList(map);
		int total = shipService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(shipList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("ship:info")
	public R info(@PathVariable("id") Long id){
		ShipEntity ship = shipService.queryObject(id);

		return R.ok().put("ship", ship);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("ship:save")
	public R save(@RequestBody ShipEntity ship){
		shipService.save(ship);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("ship:update")
	public R update(@RequestBody ShipEntity ship){
		shipService.update(ship);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("ship:delete")
	public R delete(@RequestBody Long[] ids){
		shipService.deleteBatch(ids);

		return R.ok();
	}

}
