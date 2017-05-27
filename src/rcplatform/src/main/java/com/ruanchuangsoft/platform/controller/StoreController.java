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

import com.ruanchuangsoft.platform.entity.StoreEntity;
import com.ruanchuangsoft.platform.service.StoreService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 仓库管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:14:30
 */
@Controller
@RequestMapping("store")
public class StoreController extends AbstractController {
	@Autowired
	private StoreService storeService;

	@RequestMapping("/store")
	public String list(){
		return "store/store";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/store");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("store:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<StoreEntity> storeList = storeService.queryList(map);
		int total = storeService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(storeList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("store:info")
	public R info(@PathVariable("id") Long id){
		StoreEntity store = storeService.queryObject(id);

		return R.ok().put("store", store);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("store:save")
	public R save(@RequestBody StoreEntity store){
		storeService.save(store);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("store:update")
	public R update(@RequestBody StoreEntity store){
		storeService.update(store);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("store:delete")
	public R delete(@RequestBody Long[] ids){
		storeService.deleteBatch(ids);

		return R.ok();
	}

}
