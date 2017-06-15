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

import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;
import com.ruanchuangsoft.platform.service.StorecontractdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 仓储合同明细
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 20:39:26
 */
@Controller
@RequestMapping("storecontractdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class StorecontractdetailController extends AbstractController {
	@Autowired
	private StorecontractdetailService storecontractdetailService;

	@RequestMapping("/storecontractdetail")
	public String list(){
		return "storecontractdetail/storecontractdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("storecontractdetail/storecontractdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("storecontractdetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<StorecontractdetailEntity> storecontractdetailList = storecontractdetailService.queryList(map);
		int total = storecontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(storecontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storecontractdetail:info")
	public R info(@PathVariable("id") Long id){
		StorecontractdetailEntity storecontractdetail = storecontractdetailService.queryObject(id);

		return R.ok().put("storecontractdetail", storecontractdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("storecontractdetail:save")
	public R save(@RequestBody StorecontractdetailEntity storecontractdetail){
		storecontractdetailService.save(storecontractdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("storecontractdetail:update")
	public R update(@RequestBody StorecontractdetailEntity storecontractdetail){
		storecontractdetailService.update(storecontractdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("storecontractdetail:delete")
	public R delete(@RequestBody Long[] ids){
		storecontractdetailService.deleteBatch(ids);

		return R.ok();
	}

}
