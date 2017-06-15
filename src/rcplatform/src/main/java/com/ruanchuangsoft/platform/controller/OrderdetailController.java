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

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import com.ruanchuangsoft.platform.service.OrderdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订购明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-10 19:20:37
 */
@Controller
@RequestMapping("orderdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class OrderdetailController extends AbstractController {
	@Autowired
	private OrderdetailService orderdetailService;

	@RequestMapping("/orderdetail")
	public String list(){
		return "orderdetail/orderdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("orderdetail/orderdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("orderdetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<OrderdetailEntity> orderdetailList = orderdetailService.queryList(map);
		int total = orderdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(orderdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("orderdetail:info")
	public R info(@PathVariable("id") Long id){
		OrderdetailEntity orderdetail = orderdetailService.queryObject(id);

		return R.ok().put("orderdetail", orderdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("orderdetail:save")
	public R save(@RequestBody OrderdetailEntity orderdetail){
		orderdetailService.save(orderdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("orderdetail:update")
	public R update(@RequestBody OrderdetailEntity orderdetail){
		orderdetailService.update(orderdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("orderdetail:delete")
	public R delete(@RequestBody Long[] ids){
		orderdetailService.deleteBatch(ids);

		return R.ok();
	}

}
