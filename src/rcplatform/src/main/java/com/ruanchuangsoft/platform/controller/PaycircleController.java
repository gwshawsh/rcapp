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

import com.ruanchuangsoft.platform.entity.PaycircleEntity;
import com.ruanchuangsoft.platform.service.PaycircleService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 结算周期
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 16:49:45
 */
@Controller
@RequestMapping("paycircle")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class PaycircleController extends AbstractController {
    @Autowired
    private PaycircleService paycircleService;

    @RequestMapping("/paycircle")
    public String list() {
        return "paycircle/paycircle";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/paycircle");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("paycircle:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    PaycircleEntity param = JSON.parseObject(tmpquery, PaycircleEntity.class);
                                    map.put("id", param.getId());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("paytype", param.getPaytype());
                                    map.put("payday1", param.getPayday1());
                                    map.put("payday2", param.getPayday2());
                                    map.put("uptdate", param.getUptdate());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<PaycircleEntity> paycircleList = paycircleService.queryList(map);
        int total = paycircleService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(paycircleList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("paycircle:info")
    public R info(@PathVariable("id") Long id) {
            PaycircleEntity paycircle = paycircleService.queryObject(id);

        return R.ok().put("paycircle", paycircle);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("paycircle:save")
    public R save(@RequestBody PaycircleEntity paycircle) {
                      paycircleService.save(paycircle);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("paycircle:update")
    public R submitworkflow(@RequestBody Long id) {
            PaycircleEntity paycircleEntity = paycircleService.queryObject(id);
        if (paycircleEntity == null) {
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
    @RequiresPermissions("paycircle:update")
    public R update(@RequestBody PaycircleEntity paycircle) {
            paycircleService.update(paycircle);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("paycircle:delete")
    public R delete(@RequestBody Long[]ids) {
            paycircleService.deleteBatch(ids);

        return R.ok();
    }


   
}
