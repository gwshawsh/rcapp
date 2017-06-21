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

import com.ruanchuangsoft.platform.entity.ShipplanEntity;
import com.ruanchuangsoft.platform.service.ShipplanService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 船舶计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
@Controller
@RequestMapping("shipplan")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ShipplanController extends AbstractController {
	@Autowired
	private ShipplanService shipplanService;

	@RequestMapping("/shipplan")
	public String list(){
		return "shipplan/shipplan";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/shipplan");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("shipplan:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<ShipplanEntity> shipplanList = shipplanService.queryList(map);
		int total = shipplanService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(shipplanList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("shipplan:info")
	public R info(@PathVariable("id") Long id){
		ShipplanEntity shipplan = shipplanService.queryObject(id);

		return R.ok().put("shipplan", shipplan);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("shipplan:save")
	public R save(@RequestBody ShipplanEntity shipplan){
		shipplanService.save(shipplan);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("shipplan:update")
	public R update(@RequestBody ShipplanEntity shipplan){
		shipplanService.update(shipplan);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("shipplan:delete")
	public R delete(@RequestBody Long[] ids){
		shipplanService.deleteBatch(ids);

		return R.ok();
	}

}
