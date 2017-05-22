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

import com.ruanchuangsoft.platform.entity.BudgetformEntity;
import com.ruanchuangsoft.platform.service.BudgetformService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 预算计划主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 16:37:43
 */
@Controller
@RequestMapping("budgetform")
public class BudgetformController extends AbstractController {
	@Autowired
	private BudgetformService budgetformService;

	@RequestMapping("/budgetform")
	public String list(){
		return "budgetform/budgetform";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/budgetform");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("budgetform:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BudgetformEntity> budgetformList = budgetformService.queryList(map);
		int total = budgetformService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(budgetformList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("budgetform:info")
	public R info(@PathVariable("id") Long id){
		BudgetformEntity budgetform = budgetformService.queryObject(id);

		return R.ok().put("budgetform", budgetform);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("budgetform:save")
	public R save(@RequestBody BudgetformEntity budgetform){
		budgetformService.save(budgetform);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("budgetform:update")
	public R update(@RequestBody BudgetformEntity budgetform){
		budgetformService.update(budgetform);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("budgetform:delete")
	public R delete(@RequestBody Long[] ids){
		budgetformService.deleteBatch(ids);

		return R.ok();
	}

}
