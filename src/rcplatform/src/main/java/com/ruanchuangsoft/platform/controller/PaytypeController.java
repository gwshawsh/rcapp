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

import com.ruanchuangsoft.platform.entity.PaytypeEntity;
import com.ruanchuangsoft.platform.service.PaytypeService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 付款方式
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
@Controller
@RequestMapping("paytype")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PaytypeController extends AbstractController {
	@Autowired
	private PaytypeService paytypeService;

	@RequestMapping("/paytype")
	public String list(){
		return "paytype/paytype";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("paytype/paytype");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("paytype:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PaytypeEntity> paytypeList = paytypeService.queryList(map);
		int total = paytypeService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(paytypeList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("paytype:info")
	public R info(@PathVariable("id") Long id){
		PaytypeEntity paytype = paytypeService.queryObject(id);

		return R.ok().put("paytype", paytype);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("paytype:save")
	public R save(@RequestBody PaytypeEntity paytype){
		paytypeService.save(paytype);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("paytype:update")
	public R update(@RequestBody PaytypeEntity paytype){
		paytypeService.update(paytype);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("paytype:delete")
	public R delete(@RequestBody Long[] ids){
		paytypeService.deleteBatch(ids);

		return R.ok();
	}

}
