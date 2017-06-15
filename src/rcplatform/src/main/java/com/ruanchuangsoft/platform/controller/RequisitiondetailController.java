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

import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import com.ruanchuangsoft.platform.service.RequisitiondetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请购明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-10 20:13:30
 */
@Controller
@RequestMapping("requisitiondetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RequisitiondetailController extends AbstractController {
	@Autowired
	private RequisitiondetailService requisitiondetailService;

	@RequestMapping("/requisitiondetail")
	public String list(){
		return "requisitiondetail/requisitiondetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("requisitiondetail/requisitiondetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("requisitiondetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<RequisitiondetailEntity> requisitiondetailList = requisitiondetailService.queryList(map);
		int total = requisitiondetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(requisitiondetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("requisitiondetail:info")
	public R info(@PathVariable("id") Long id){
		RequisitiondetailEntity requisitiondetail = requisitiondetailService.queryObject(id);

		return R.ok().put("requisitiondetail", requisitiondetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("requisitiondetail:save")
	public R save(@RequestBody RequisitiondetailEntity requisitiondetail){
		requisitiondetailService.save(requisitiondetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("requisitiondetail:update")
	public R update(@RequestBody RequisitiondetailEntity requisitiondetail){
		requisitiondetailService.update(requisitiondetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("requisitiondetail:delete")
	public R delete(@RequestBody Long[] ids){
		requisitiondetailService.deleteBatch(ids);

		return R.ok();
	}

}
