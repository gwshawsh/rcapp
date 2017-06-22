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

import com.ruanchuangsoft.platform.entity.OrganizationEntity;
import com.ruanchuangsoft.platform.service.OrganizationService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 组织管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-21 18:46:43
 */
@Controller
@RequestMapping("organization")
public class OrganizationController extends AbstractController {
	@Autowired
	private OrganizationService organizationService;

	@RequestMapping("/organization")
	public String list(){
		return "organization/organization";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/organization");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("organization:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<OrganizationEntity> organizationList = organizationService.queryList(map);
		int total = organizationService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(organizationList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 选择菜单(添加、修改菜单)
     */
    @ResponseBody
    @RequestMapping("/select")
    @RequiresPermissions("organization:select")
    public R select() {
        //查询列表数据
        Map<String, Object> map = new HashMap<>();
        List<OrganizationEntity> organizationList = organizationService.queryList(map);

        //添加顶级菜单
		OrganizationEntity root = new OrganizationEntity();
        root.setId(0L);
        root.setName("组织管理");
        root.setParentId(-1L);
        root.setOpen(true);
		organizationList.add(root);

        return R.ok().put("treeList", organizationList);
    }



    /**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("organization:info")
	public R info(@PathVariable("id") Long id){
		OrganizationEntity organization = organizationService.queryObject(id);

		return R.ok().put("organization", organization);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("organization:save")
	public R save(@RequestBody OrganizationEntity organization){
		organizationService.save(organization);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("organization:update")
	public R update(@RequestBody OrganizationEntity organization){
		organizationService.update(organization);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("organization:delete")
	public R delete(@RequestBody Long[] ids){
		organizationService.deleteBatch(ids);

		return R.ok();
	}

}
