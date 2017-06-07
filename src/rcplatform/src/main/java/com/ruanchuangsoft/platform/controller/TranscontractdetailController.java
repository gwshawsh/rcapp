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

import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import com.ruanchuangsoft.platform.service.TranscontractdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输合同明细
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:52:16
 */
@Controller
@RequestMapping("transcontractdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TranscontractdetailController extends AbstractController {
	@Autowired
	private TranscontractdetailService transcontractdetailService;

	@RequestMapping("/transcontractdetail")
	public String list(){
		return "transcontractdetail/transcontractdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("transcontractdetail/transcontractdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transcontractdetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TranscontractdetailEntity> transcontractdetailList = transcontractdetailService.queryList(map);
		int total = transcontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transcontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transcontractdetail:info")
	public R info(@PathVariable("id") Long id){
		TranscontractdetailEntity transcontractdetail = transcontractdetailService.queryObject(id);

		return R.ok().put("transcontractdetail", transcontractdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transcontractdetail:save")
	public R save(@RequestBody TranscontractdetailEntity transcontractdetail){
		transcontractdetailService.save(transcontractdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transcontractdetail:update")
	public R update(@RequestBody TranscontractdetailEntity transcontractdetail){
		transcontractdetailService.update(transcontractdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transcontractdetail:delete")
	public R delete(@RequestBody Long[] ids){
		transcontractdetailService.deleteBatch(ids);

		return R.ok();
	}

}
