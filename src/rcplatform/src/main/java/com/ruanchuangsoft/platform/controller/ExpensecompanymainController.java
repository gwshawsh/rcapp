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

import com.ruanchuangsoft.platform.entity.ExpensecompanymainEntity;
import com.ruanchuangsoft.platform.service.ExpensecompanymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 公司费用
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 13:56:56
 */
@Controller
@RequestMapping("expensecompanymain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class ExpensecompanymainController extends AbstractController {
    @Autowired
    private ExpensecompanymainService expensecompanymainService;

    @RequestMapping("/expensecompanymain")
    public String list() {
        return "expensecompanymain/expensecompanymain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/expensecompanymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("expensecompanymain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    ExpensecompanymainEntity param = JSON.parseObject(tmpquery, ExpensecompanymainEntity.class);
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
        List<ExpensecompanymainEntity> expensecompanymainList = expensecompanymainService.queryList(map);
        int total = expensecompanymainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(expensecompanymainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("expensecompanymain:info")
    public R info(@PathVariable("id") Long id) {
            ExpensecompanymainEntity expensecompanymain = expensecompanymainService.queryObject(id);

        return R.ok().put("expensecompanymain", expensecompanymain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("expensecompanymain:save")
    public R save(@RequestBody ExpensecompanymainEntity expensecompanymain) {
                      expensecompanymainService.save(expensecompanymain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("expensecompanymain:update")
    public R submitworkflow(@RequestBody Long id) {
            ExpensecompanymainEntity expensecompanymainEntity = expensecompanymainService.queryObject(id);
        if (expensecompanymainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                                                                                                                                                                                                                                        
                Map<String, Object> params = new HashMap<>();
                params.put("userid", ShiroUtils.getUserId());
                String processid = startWorkflow("expensecompanymain", expensecompanymainEntity.getBillno(), params);

                    expensecompanymainEntity.setBillstatus(BillStatus.SUBMIT);
                    expensecompanymainEntity.setPocessinstanceid(processid);
                    expensecompanymainService.update(expensecompanymainEntity);

                    


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("expensecompanymain:update")
    public R update(@RequestBody ExpensecompanymainEntity expensecompanymain) {
            expensecompanymainService.update(expensecompanymain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("expensecompanymain:delete")
    public R delete(@RequestBody Long[]ids) {
            expensecompanymainService.deleteBatch(ids);

        return R.ok();
    }

    /**
   * 签收
   * 只有单据状态为提交状态的，才能够签收
   */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("expensecompanymain:claim")
    public R claim(@RequestBody Long[]ids) {

        for (Long attkey:
                                ids) {
                ExpensecompanymainEntity expensecompanymainEntity = expensecompanymainService.queryObject(attkey);
            if (expensecompanymainEntity != null && expensecompanymainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    expensecompanymainEntity.setBillstatus(BillStatus.CLAIM);
                    expensecompanymainService.update(expensecompanymainEntity);

                //新增一条处理记录：签收
                newBillcomments(expensecompanymainEntity.getBillno(),"签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(expensecompanymainEntity.getBillno());
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
    @RequiresPermissions("expensecompanymain:audit")
    public R audit(@RequestBody ExpensecompanymainEntity expensecompanymainEntity) {

        BillcommentsEntity billcommentsEntity = expensecompanymainEntity.getBillcommentsEntity();
            expensecompanymainEntity.setBillstatus(BillStatus.AUDIT);

            expensecompanymainService.update(expensecompanymainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(expensecompanymainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(expensecompanymainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                    expensecompanymainEntity.setBillstatus(BillStatus.COMPLETE);
                    expensecompanymainService.update(expensecompanymainEntity);
            }
        }

        return R.ok();
    }


}
