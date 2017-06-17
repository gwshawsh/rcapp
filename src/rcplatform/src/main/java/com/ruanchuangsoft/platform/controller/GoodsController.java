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

import com.ruanchuangsoft.platform.entity.GoodsEntity;
import com.ruanchuangsoft.platform.service.GoodsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 商品表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
@Controller
@RequestMapping("goods")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class GoodsController extends AbstractController {
	@Autowired
	private GoodsService goodsService;

	@RequestMapping("/goods")
	public String list(){
		return "goods/goods";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("goods/goods");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("goods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<GoodsEntity> goodsList = goodsService.queryList(map);
		int total = goodsService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(goodsList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{goodsId}")
	@RequiresPermissions("goods:info")
	public R info(@PathVariable("goodsId") Long goodsId){
		GoodsEntity goods = goodsService.queryObject(goodsId);

		return R.ok().put("goods", goods);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("goods:save")
	public R save(@RequestBody GoodsEntity goods){
		goodsService.save(goods);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("goods:update")
	public R update(@RequestBody GoodsEntity goods){
		goodsService.update(goods);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("goods:delete")
	public R delete(@RequestBody Long[] goodsIds){
		goodsService.deleteBatch(goodsIds);

		return R.ok();
	}

}
