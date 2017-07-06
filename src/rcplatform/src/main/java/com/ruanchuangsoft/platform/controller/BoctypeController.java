package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.BoctypeEntity;
import com.ruanchuangsoft.platform.service.BoctypeService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 币别
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
@Controller
@RequestMapping("boctype")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class BoctypeController extends AbstractController {
    @Autowired
    private BoctypeService boctypeService;

    @RequestMapping("/boctype")
    public String list() {
        return "boctype/boctype";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/boctype");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("boctype:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    BoctypeEntity param = JSON.parseObject(tmpquery, BoctypeEntity.class);
                                    map.put("id", param.getId());
                                    map.put("boctypecode", param.getBoctypecode());
                                    map.put("boctypename", param.getBoctypename());
                                    map.put("rate", param.getRate());
                                    map.put("unit", param.getUnit());
                                    map.put("uptdate", param.getUptdate());
                                    map.put("remark", param.getRemark());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<BoctypeEntity> boctypeList = boctypeService.queryList(map);
        int total = boctypeService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(boctypeList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("boctype:info")
    public R info(@PathVariable("id") Long id) {
            BoctypeEntity boctype = boctypeService.queryObject(id);

        return R.ok().put("boctype", boctype);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("boctype:save")
    public R save(@RequestBody BoctypeEntity boctype) {
                      boctypeService.save(boctype);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("boctype:update")
    public R submitworkflow(@RequestBody Long id) {
            BoctypeEntity boctypeEntity = boctypeService.queryObject(id);
        if (boctypeEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                    


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("boctype:update")
    public R update(@RequestBody BoctypeEntity boctype) {
            boctypeService.update(boctype);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("boctype:delete")
    public R delete(@RequestBody Long[]ids) {
            boctypeService.deleteBatch(ids);

        return R.ok();
    }



}
