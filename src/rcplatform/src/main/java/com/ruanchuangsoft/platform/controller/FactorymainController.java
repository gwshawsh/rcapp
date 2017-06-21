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

import com.ruanchuangsoft.platform.entity.FactorymainEntity;
import com.ruanchuangsoft.platform.service.FactorymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 门点计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 23:21:01
 */
@Controller
@RequestMapping("factorymain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class FactorymainController extends AbstractController {
	@Autowired
	private FactorymainService factorymainService;

	@RequestMapping("/factorymain")
	public String list(){
		return "factorymain/factorymain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/factorymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("factorymain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<FactorymainEntity> factorymainList = factorymainService.queryList(map);
		int total = factorymainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(factorymainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("factorymain:info")
	public R info(@PathVariable("id") Long id){
		FactorymainEntity factorymain = factorymainService.queryObject(id);

		return R.ok().put("factorymain", factorymain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("factorymain:save")
	public R save(@RequestBody FactorymainEntity factorymain){
		factorymainService.save(factorymain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("factorymain:update")
	public R update(@RequestBody FactorymainEntity factorymain){
		factorymainService.update(factorymain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("factorymain:delete")
	public R delete(@RequestBody Long[] ids){
		factorymainService.deleteBatch(ids);

		return R.ok();
	}

}
