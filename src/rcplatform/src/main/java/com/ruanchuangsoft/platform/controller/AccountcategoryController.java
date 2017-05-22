package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.SysDeptEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.AccountcategoryEntity;
import com.ruanchuangsoft.platform.service.AccountcategoryService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 预算科目
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 09:15:02
 */
@Controller
@RequestMapping("accountcategory")
public class AccountcategoryController extends AbstractController {
	@Autowired
	private AccountcategoryService accountcategoryService;

	@RequestMapping("/accountcategory")
	public String list(){
		return "accountcategory/accountcategory";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/accountcategory");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("accountcategory:list")
	public R list(Integer id,Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		if (id != null && id != 0) {
			map.put("id", id);
		}
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<AccountcategoryEntity> accountcategoryList = accountcategoryService.queryList(map);
		int total = accountcategoryService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(accountcategoryList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 选择菜单(添加、修改菜单)
	 */
	@ResponseBody
	@RequestMapping("/select")
	public R select() {
		//查询列表数据
		Map<String, Object> map = new HashMap<>();
		List<AccountcategoryEntity> dataList = accountcategoryService.queryList(map);

		//添加顶级菜单
		AccountcategoryEntity root = new AccountcategoryEntity();
		root.setId(0L);
		root.setName("预算科目");
		root.setParentId(-1L);
		root.setOpen(true);
		dataList.add(root);

		return R.ok().put("treeList", dataList);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("accountcategory:info")
	public R info(@PathVariable("id") Long id){
		AccountcategoryEntity accountcategory = accountcategoryService.queryObject(id);

		return R.ok().put("accountcategory", accountcategory);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("accountcategory:save")
	public R save(@RequestBody AccountcategoryEntity accountcategory){
		accountcategoryService.save(accountcategory);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("accountcategory:update")
	public R update(@RequestBody AccountcategoryEntity accountcategory){
		accountcategoryService.update(accountcategory);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("accountcategory:delete")
	public R delete(@RequestBody Long[] ids){
		accountcategoryService.deleteBatch(ids);

		return R.ok();
	}

}
