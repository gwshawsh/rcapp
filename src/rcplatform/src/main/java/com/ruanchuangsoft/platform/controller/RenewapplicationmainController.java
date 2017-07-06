package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
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

import com.ruanchuangsoft.platform.entity.RenewapplicationmainEntity;
import com.ruanchuangsoft.platform.service.RenewapplicationmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 续签申请
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
@Controller
@RequestMapping("renewapplicationmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class RenewapplicationmainController extends AbstractController {
    @Autowired
    private RenewapplicationmainService renewapplicationmainService;

    @RequestMapping("/renewapplicationmain")
    public String list() {
        return "renewapplicationmain/renewapplicationmain" ;
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("member/renewapplicationmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("renewapplicationmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                RenewapplicationmainEntity param = JSON.parseObject(tmpquery, RenewapplicationmainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("name", param.getName());
                map.put("applicationday", param.getApplicationday());
                map.put("deptid", param.getDeptid());
                map.put("roleid", param.getRoleid());
                map.put("renewroleid", param.getRenewroleid());
                map.put("entryday", param.getEntryday());
                map.put("personalapplication", param.getPersonalapplication());
                map.put("applicationapproval", param.getApplicationapproval());
                map.put("reason", param.getReason());
                map.put("handover", param.getHandover());
                map.put("billstatus", param.getBillstatus());
                map.put("remark", param.getRemark());
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
        List<RenewapplicationmainEntity> renewapplicationmainList = renewapplicationmainService.queryList(map);
        int total = renewapplicationmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(renewapplicationmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("renewapplicationmain:info")
    public R info(@PathVariable("id") Long id) {
        RenewapplicationmainEntity renewapplicationmain = renewapplicationmainService.queryObject(id);

        return R.ok().put("renewapplicationmain", renewapplicationmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("renewapplicationmain:save")
    public R save(@RequestBody RenewapplicationmainEntity renewapplicationmain) {
        if (renewapplicationmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            renewapplicationmain.setBillno(billno);
            renewapplicationmain.setBillstatus(BillStatus.NEW);

            if (renewapplicationmain.getFiles() != null && renewapplicationmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : renewapplicationmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        renewapplicationmainService.save(renewapplicationmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("renewapplicationmain:update")
    public R submitworkflow(@RequestBody Long id) {
        RenewapplicationmainEntity renewapplicationmainEntity = renewapplicationmainService.queryObject(id);
        if (renewapplicationmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程

        Map<String, Object> params = new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid = startWorkflow("renewapplicationmain", renewapplicationmainEntity.getBillno(), params);

        renewapplicationmainEntity.setBillstatus(BillStatus.SUBMIT);
        renewapplicationmainEntity.setPocessinstanceid(processid);
        renewapplicationmainService.update(renewapplicationmainEntity);


        return R.ok();
    }


    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("renewapplicationmain:update")
    public R update(@RequestBody RenewapplicationmainEntity renewapplicationmain) {
        renewapplicationmainService.update(renewapplicationmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("renewapplicationmain:delete")
    public R delete(@RequestBody Long[] ids) {
        renewapplicationmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("renewapplicationmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            RenewapplicationmainEntity renewapplicationmainEntity = renewapplicationmainService.queryObject(attkey);
            if (renewapplicationmainEntity != null && renewapplicationmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                renewapplicationmainEntity.setBillstatus(BillStatus.CLAIM);
                renewapplicationmainService.update(renewapplicationmainEntity);

                //新增一条处理记录：签收
                newBillcomments(renewapplicationmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(renewapplicationmainEntity.getBillno());
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
    @RequiresPermissions("renewapplicationmain:audit")
    public R audit(@RequestBody RenewapplicationmainEntity renewapplicationmainEntity) {

        BillcommentsEntity billcommentsEntity = renewapplicationmainEntity.getBillcommentsEntity();
        renewapplicationmainEntity.setBillstatus(BillStatus.AUDIT);

        renewapplicationmainService.update(renewapplicationmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(renewapplicationmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(renewapplicationmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                renewapplicationmainEntity.setBillstatus(BillStatus.COMPLETE);
                renewapplicationmainService.update(renewapplicationmainEntity);
            }
        }

        return R.ok();
    }

}
