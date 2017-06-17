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

import com.ruanchuangsoft.platform.entity.BoctypeEntity;
import com.ruanchuangsoft.platform.service.BoctypeService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 币别
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
@Controller
@RequestMapping("boctype")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BoctypeController extends AbstractController {
	@Autowired
	private BoctypeService boctypeService;

	@RequestMapping("/boctype")
	public String list(){
		return "boctype/boctype";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("boctype/boctype");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("boctype:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BoctypeEntity> boctypeList = boctypeService.queryList(map);
		int total = boctypeService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(boctypeList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("boctype:info")
	public R info(@PathVariable("id") Long id){
		BoctypeEntity boctype = boctypeService.queryObject(id);

		return R.ok().put("boctype", boctype);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("boctype:save")
	public R save(@RequestBody BoctypeEntity boctype){
		boctypeService.save(boctype);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("boctype:update")
	public R update(@RequestBody BoctypeEntity boctype){
		boctypeService.update(boctype);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("boctype:delete")
	public R delete(@RequestBody Long[] ids){
		boctypeService.deleteBatch(ids);

		return R.ok();
	}

}
