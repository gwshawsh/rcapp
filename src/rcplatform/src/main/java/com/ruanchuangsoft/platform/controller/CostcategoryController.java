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

import com.ruanchuangsoft.platform.entity.CostcategoryEntity;
import com.ruanchuangsoft.platform.service.CostcategoryService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 费用科目
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-06 12:43:24
 */
@Controller
@RequestMapping("costcategory")
public class CostcategoryController extends AbstractController {
	@Autowired
	private CostcategoryService costcategoryService;

	@RequestMapping("/costcategory")
	public String list(){
		return "costcategory/costcategory";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/costcategory");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("costcategory:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<CostcategoryEntity> costcategoryList = costcategoryService.queryList(map);
		int total = costcategoryService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(costcategoryList, total, limit, page);

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
        List<CostcategoryEntity> costcategoryList = costcategoryService.queryList(map);

        //添加顶级菜单
		CostcategoryEntity root = new CostcategoryEntity();
        root.setId(0L);
        root.setName("费用科目");
        root.setParentId(-1L);
        root.setOpen(true);
		costcategoryList.add(root);

        return R.ok().put("treeList", costcategoryList);
    }



    /**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("costcategory:info")
	public R info(@PathVariable("id") Long id){
		CostcategoryEntity costcategory = costcategoryService.queryObject(id);

		return R.ok().put("costcategory", costcategory);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("costcategory:save")
	public R save(@RequestBody CostcategoryEntity costcategory){
		costcategoryService.save(costcategory);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("costcategory:update")
	public R update(@RequestBody CostcategoryEntity costcategory){
		costcategoryService.update(costcategory);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("costcategory:delete")
	public R delete(@RequestBody Long[] ids){
		costcategoryService.deleteBatch(ids);

		return R.ok();
	}

}
