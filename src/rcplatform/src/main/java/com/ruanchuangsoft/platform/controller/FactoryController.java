package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.service.FactoryService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 工厂管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
@Controller
@RequestMapping("factory")
public class FactoryController extends AbstractController {
    @Autowired
    private FactoryService factoryService;


    @RequestMapping("/factory")
    public String list() {
        return "factory/factory";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/factory");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("factory:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<FactoryEntity> factoryList = factoryService.queryList(map);
        int total = factoryService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(factoryList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("factory:info")
    public R info(@PathVariable("id") Long id) {
        FactoryEntity factory = factoryService.queryObject(id);

        return R.ok().put("factory", factory);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("factory:save")
    public R save(@RequestBody FactoryEntity factory) {
        factoryService.save(factory);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("factory:update")
    public R update(@RequestBody FactoryEntity factory) {
        factoryService.update(factory);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("factory:delete")
    public R delete(@RequestBody Long[] ids) {
        factoryService.deleteBatch(ids);

        return R.ok();
    }



}
