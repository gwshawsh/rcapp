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

import com.ruanchuangsoft.platform.entity.ExpensemainEntity;
import com.ruanchuangsoft.platform.service.ExpensemainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 报销单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 13:56:56
 */
@Controller
@RequestMapping("expensemain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class ExpensemainController extends AbstractController {
    @Autowired
    private ExpensemainService expensemainService;

    @RequestMapping("/expensemain")
    public String list() {
        return "expensemain/expensemain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/expensemain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("expensemain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    ExpensemainEntity param = JSON.parseObject(tmpquery, ExpensemainEntity.class);
                                    map.put("id", param.getId());
                                    map.put("billno", param.getBillno());
                                    map.put("deptid", param.getDeptid());
                                    map.put("applydate", param.getApplydate());
                                    map.put("costcategoryid", param.getCostcategoryid());
                                    map.put("expensemoney", param.getExpensemoney());
                                    map.put("title", param.getTitle());
                                    map.put("remark", param.getRemark());
                                    map.put("receiver", param.getReceiver());
                                    map.put("paytype", param.getPaytype());
                                    map.put("bankaccount", param.getBankaccount());
                                    map.put("billstatus", param.getBillstatus());
                                    map.put("makeuser", param.getMakeuser());
                                    map.put("makedate", param.getMakedate());
                                    map.put("accuser", param.getAccuser());
                                    map.put("accdate", param.getAccdate());
                                    map.put("uptdate", param.getUptdate());
                                    map.put("pocessinstanceid", param.getPocessinstanceid());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<ExpensemainEntity> expensemainList = expensemainService.queryList(map);
        int total = expensemainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(expensemainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("expensemain:info")
    public R info(@PathVariable("id") Long id) {
            ExpensemainEntity expensemain = expensemainService.queryObject(id);

        return R.ok().put("expensemain", expensemain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("expensemain:save")
    public R save(@RequestBody ExpensemainEntity expensemain) {
                      expensemainService.save(expensemain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("expensemain:update")
    public R submitworkflow(@RequestBody Long id) {
            ExpensemainEntity expensemainEntity = expensemainService.queryObject(id);
        if (expensemainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                                                                                                                                                                                                                                        
                Map<String, Object> params = new HashMap<>();
                params.put("userid", ShiroUtils.getUserId());
                String processid = startWorkflow("expensemain", expensemainEntity.getBillno(), params);

                    expensemainEntity.setBillstatus(BillStatus.SUBMIT);
                    expensemainEntity.setPocessinstanceid(processid);
                    expensemainService.update(expensemainEntity);

                    


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("expensemain:update")
    public R update(@RequestBody ExpensemainEntity expensemain) {
            expensemainService.update(expensemain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("expensemain:delete")
    public R delete(@RequestBody Long[]ids) {
            expensemainService.deleteBatch(ids);

        return R.ok();
    }

    /**
   * 签收
   * 只有单据状态为提交状态的，才能够签收
   */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("expensemain:claim")
    public R claim(@RequestBody Long[]ids) {

        for (Long attkey:
                                ids) {
                ExpensemainEntity expensemainEntity = expensemainService.queryObject(attkey);
            if (expensemainEntity != null && expensemainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    expensemainEntity.setBillstatus(BillStatus.CLAIM);
                    expensemainService.update(expensemainEntity);

                //新增一条处理记录：签收
                newBillcomments(expensemainEntity.getBillno(),"签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(expensemainEntity.getBillno());
                if (task != null) {
                    claimTasks(task);
                }
            }
        }


        return R.ok();
    }

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("expensemain:audit")
    public R audit(@RequestBody ExpensemainEntity expensemainEntity) {

        BillcommentsEntity billcommentsEntity = expensemainEntity.getBillcommentsEntity();
            expensemainEntity.setBillstatus(BillStatus.AUDIT);

            expensemainService.update(expensemainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(expensemainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(expensemainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                    expensemainEntity.setBillstatus(BillStatus.COMPLETE);
                    expensemainService.update(expensemainEntity);
            }
        }

        return R.ok();
    }


}
