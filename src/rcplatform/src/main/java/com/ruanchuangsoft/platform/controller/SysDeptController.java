package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.ruanchuangsoft.platform.entity.SysMenuEntity;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.SysDeptEntity;
import com.ruanchuangsoft.platform.service.SysDeptService;
import org.springframework.web.servlet.ModelAndView;


/**
 * 部门管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-04-18 21:22:26
 */
@RestController
@RequestMapping("/sys_dept")
public class SysDeptController extends AbstractController {

    @Autowired
    private SysDeptService sysDeptService;

    String[] keys = new String[]{"dept.title", "dept.column.deptid", "dept.column.deptname"};

    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("sys/dept");

        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);


        return view;

    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:dept:list")
    public R list(Integer deptId, Integer page, Integer limit) {


        Map<String, Object> map = new HashMap<>();
        if (deptId != null && deptId != 0) {
            map.put("deptId", deptId);
        }
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<SysDeptEntity> sysDeptList = sysDeptService.queryList(map);
        int total = sysDeptService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(sysDeptList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @ResponseBody
    @RequestMapping("/select")
    @RequiresPermissions("sys:dept:select")
    public R select() {
        //查询列表数据
        Map<String, Object> map = new HashMap<>();
        List<SysDeptEntity> sysDeptList = sysDeptService.queryList(map);

        //添加顶级菜单
        SysDeptEntity root = new SysDeptEntity();
        root.setId(0L);
        root.setName("部门管理");
        root.setParentId(-1L);
        root.setOpen(true);
        sysDeptList.add(root);

        return R.ok().put("treeList", sysDeptList);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{deptId}")
    @RequiresPermissions("sys:dept:info")
    public R info(@PathVariable("deptId") Long deptId) {
        SysDeptEntity sysDept = sysDeptService.queryObject(deptId);

        return R.ok().put("dept", sysDept);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:dept:save")
    public R save(@RequestBody SysDeptEntity sysDept) {
        sysDeptService.save(sysDept);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:dept:update")
    public R update(@RequestBody SysDeptEntity sysDept) {
        sysDeptService.update(sysDept);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("sys:dept:delete")
    public R delete(@RequestBody Long[] deptIds) {
        sysDeptService.deleteBatch(deptIds);

        return R.ok();
    }

}
