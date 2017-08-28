package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
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

import com.ruanchuangsoft.platform.entity.TransferapplicationmainEntity;
import com.ruanchuangsoft.platform.service.TransferapplicationmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 调岗申请
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
@Controller
@RequestMapping("transferapplicationmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class TransferapplicationmainController extends AbstractController {
    @Autowired
    private TransferapplicationmainService transferapplicationmainService;

    @RequestMapping("/transferapplicationmain")
    public String list() {
        return "transferapplicationmain/transferapplicationmain" ;
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("member/transferapplicationmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("transferapplicationmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                TransferapplicationmainEntity param = JSON.parseObject(tmpquery, TransferapplicationmainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("name", param.getName());
                map.put("applicationday", param.getApplicationday());
                map.put("deptid", param.getDeptid());
                map.put("roleid", param.getRoleid());
                map.put("outdeptid", param.getOutdeptid());
                map.put("outroleid", param.getOutroleid());
                map.put("indeptid", param.getIndeptid());
                map.put("inroleid", param.getInroleid());
                map.put("reason", param.getReason());
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
        List<TransferapplicationmainEntity> transferapplicationmainList = transferapplicationmainService.queryList(map);
        int total = transferapplicationmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(transferapplicationmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("transferapplicationmain:info")
    public R info(@PathVariable("id") Long id) {
        TransferapplicationmainEntity transferapplicationmain = transferapplicationmainService.queryObject(id);

        return R.ok().put("transferapplicationmain", transferapplicationmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("transferapplicationmain:save")
    public R save(@RequestBody TransferapplicationmainEntity transferapplicationmain) {
        if (transferapplicationmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            transferapplicationmain.setBillno(billno);
            transferapplicationmain.setBillstatus(BillStatus.NEW);


            if (transferapplicationmain.getFiles() != null && transferapplicationmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : transferapplicationmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        transferapplicationmainService.save(transferapplicationmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("transferapplicationmain:update")
    public R submitworkflow(@RequestBody Long id) {
        TransferapplicationmainEntity transferapplicationmainEntity = transferapplicationmainService.queryObject(id);
        if (transferapplicationmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程

        Map<String, Object> params = new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid = startWorkflow("transferapplicationmain", transferapplicationmainEntity.getBillno(), params);

        transferapplicationmainEntity.setBillstatus(BillStatus.SUBMIT);
        transferapplicationmainEntity.setPocessinstanceid(processid);
        transferapplicationmainService.update(transferapplicationmainEntity);


        return R.ok();
    }


    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("transferapplicationmain:update")
    public R update(@RequestBody TransferapplicationmainEntity transferapplicationmain) {
        transferapplicationmainService.update(transferapplicationmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("transferapplicationmain:delete")
    public R delete(@RequestBody Long[] ids) {
        transferapplicationmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("transferapplicationmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            TransferapplicationmainEntity transferapplicationmainEntity = transferapplicationmainService.queryObject(attkey);
            if (transferapplicationmainEntity != null && transferapplicationmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                transferapplicationmainEntity.setBillstatus(BillStatus.CLAIM);
                transferapplicationmainService.update(transferapplicationmainEntity);

                //新增一条处理记录：签收
                newBillcomments(transferapplicationmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(transferapplicationmainEntity.getBillno());
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
    @RequiresPermissions("transferapplicationmain:audit")
    public R audit(@RequestBody TransferapplicationmainEntity transferapplicationmainEntity) {

        BillcommentsEntity billcommentsEntity = transferapplicationmainEntity.getBillcommentsEntity();
        transferapplicationmainEntity.setBillstatus(BillStatus.AUDITING);

        transferapplicationmainService.update(transferapplicationmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(transferapplicationmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(transferapplicationmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                transferapplicationmainEntity.setBillstatus(BillStatus.COMPLETE);
                transferapplicationmainService.update(transferapplicationmainEntity);
            }
        }

        return R.ok();
    }

}
