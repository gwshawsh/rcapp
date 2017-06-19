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

import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.service.TransboxdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输计划明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 00:43:25
 */
@Controller
@RequestMapping("transboxdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TransboxdetailController extends AbstractController {
	@Autowired
	private TransboxdetailService transboxdetailService;

	@RequestMapping("/transboxdetail")
	public String list(){
		return "transboxdetail/transboxdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/transboxdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transboxdetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TransboxdetailEntity> transboxdetailList = transboxdetailService.queryList(map);
		int total = transboxdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transboxdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transboxdetail:info")
	public R info(@PathVariable("id") Long id){
		TransboxdetailEntity transboxdetail = transboxdetailService.queryObject(id);

		return R.ok().put("transboxdetail", transboxdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transboxdetail:save")
	public R save(@RequestBody TransboxdetailEntity transboxdetail){
		transboxdetailService.save(transboxdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transboxdetail:update")
	public R update(@RequestBody TransboxdetailEntity transboxdetail){
		transboxdetailService.update(transboxdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transboxdetail:delete")
	public R delete(@RequestBody Long[] ids){
		transboxdetailService.deleteBatch(ids);

		return R.ok();
	}

}
