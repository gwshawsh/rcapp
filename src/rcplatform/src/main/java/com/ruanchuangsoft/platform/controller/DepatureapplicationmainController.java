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

import com.ruanchuangsoft.platform.entity.DepatureapplicationmainEntity;
import com.ruanchuangsoft.platform.service.DepatureapplicationmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 离职申请
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
@Controller
@RequestMapping("depatureapplicationmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class DepatureapplicationmainController extends AbstractController {
    @Autowired
    private DepatureapplicationmainService depatureapplicationmainService;

    @RequestMapping("/depatureapplicationmain")
    public String list() {
        return "depatureapplicationmain/depatureapplicationmain" ;
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("member/depatureapplicationmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("depatureapplicationmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                DepatureapplicationmainEntity param = JSON.parseObject(tmpquery, DepatureapplicationmainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("name", param.getName());
                map.put("applicationday", param.getApplicationday());
                map.put("deptid", param.getDeptid());
                map.put("roleid", param.getRoleid());
                map.put("depatureday", param.getDepatureday());
                map.put("successer", param.getSuccesser());
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
        List<DepatureapplicationmainEntity> depatureapplicationmainList = depatureapplicationmainService.queryList(map);
        int total = depatureapplicationmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(depatureapplicationmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("depatureapplicationmain:info")
    public R info(@PathVariable("id") Long id) {
        DepatureapplicationmainEntity depatureapplicationmain = depatureapplicationmainService.queryObject(id);

        return R.ok().put("depatureapplicationmain", depatureapplicationmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("depatureapplicationmain:save")
    public R save(@RequestBody DepatureapplicationmainEntity depatureapplicationmain) {
        if (depatureapplicationmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            depatureapplicationmain.setBillno(billno);
            depatureapplicationmain.setBillstatus(BillStatus.NEW);


            if (depatureapplicationmain.getFiles() != null && depatureapplicationmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : depatureapplicationmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        depatureapplicationmainService.save(depatureapplicationmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("depatureapplicationmain:update")
    public R submitworkflow(@RequestBody Long id) {
        DepatureapplicationmainEntity depatureapplicationmainEntity = depatureapplicationmainService.queryObject(id);
        if (depatureapplicationmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程

        Map<String, Object> params = new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid = startWorkflow("depatureapplicationmain", depatureapplicationmainEntity.getBillno(), params);

        depatureapplicationmainEntity.setBillstatus(BillStatus.SUBMIT);
        depatureapplicationmainEntity.setPocessinstanceid(processid);
        depatureapplicationmainService.update(depatureapplicationmainEntity);


        return R.ok();
    }


    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("depatureapplicationmain:update")
    public R update(@RequestBody DepatureapplicationmainEntity depatureapplicationmain) {
        depatureapplicationmainService.update(depatureapplicationmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("depatureapplicationmain:delete")
    public R delete(@RequestBody Long[] ids) {
        depatureapplicationmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("depatureapplicationmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            DepatureapplicationmainEntity depatureapplicationmainEntity = depatureapplicationmainService.queryObject(attkey);
            if (depatureapplicationmainEntity != null && depatureapplicationmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                depatureapplicationmainEntity.setBillstatus(BillStatus.CLAIM);
                depatureapplicationmainService.update(depatureapplicationmainEntity);

                //新增一条处理记录：签收
                newBillcomments(depatureapplicationmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(depatureapplicationmainEntity.getBillno());
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
    @RequiresPermissions("depatureapplicationmain:audit")
    public R audit(@RequestBody DepatureapplicationmainEntity depatureapplicationmainEntity) {

        BillcommentsEntity billcommentsEntity = depatureapplicationmainEntity.getBillcommentsEntity();
        depatureapplicationmainEntity.setBillstatus(BillStatus.AUDITING);

        depatureapplicationmainService.update(depatureapplicationmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(depatureapplicationmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(depatureapplicationmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                depatureapplicationmainEntity.setBillstatus(BillStatus.COMPLETE);
                depatureapplicationmainService.update(depatureapplicationmainEntity);
            }
        }

        return R.ok();
    }

}
