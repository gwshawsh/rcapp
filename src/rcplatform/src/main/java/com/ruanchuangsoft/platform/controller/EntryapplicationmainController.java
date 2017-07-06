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

import com.ruanchuangsoft.platform.entity.EntryapplicationmainEntity;
import com.ruanchuangsoft.platform.service.EntryapplicationmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 入职申请
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
@Controller
@RequestMapping("entryapplicationmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class EntryapplicationmainController extends AbstractController {
    @Autowired
    private EntryapplicationmainService entryapplicationmainService;

    @RequestMapping("/entryapplicationmain")
    public String list() {
        return "entryapplicationmain/entryapplicationmain" ;
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("member/entryapplicationmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("entryapplicationmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                EntryapplicationmainEntity param = JSON.parseObject(tmpquery, EntryapplicationmainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("name", param.getName());
                map.put("applicationday", param.getApplicationday());
                map.put("deptid", param.getDeptid());
                map.put("roleid", param.getRoleid());
                map.put("entryday", param.getEntryday());
                map.put("probation", param.getProbation());
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
        List<EntryapplicationmainEntity> entryapplicationmainList = entryapplicationmainService.queryList(map);
        int total = entryapplicationmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(entryapplicationmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("entryapplicationmain:info")
    public R info(@PathVariable("id") Long id) {
        EntryapplicationmainEntity entryapplicationmain = entryapplicationmainService.queryObject(id);

        return R.ok().put("entryapplicationmain", entryapplicationmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("entryapplicationmain:save")
    public R save(@RequestBody EntryapplicationmainEntity entryapplicationmain) {
        if (entryapplicationmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            entryapplicationmain.setBillno(billno);
            entryapplicationmain.setBillstatus(BillStatus.NEW);


            if (entryapplicationmain.getFiles() != null && entryapplicationmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : entryapplicationmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        entryapplicationmainService.save(entryapplicationmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("entryapplicationmain:update")
    public R submitworkflow(@RequestBody Long id) {
        EntryapplicationmainEntity entryapplicationmainEntity = entryapplicationmainService.queryObject(id);
        if (entryapplicationmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程

        Map<String, Object> params = new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid = startWorkflow("entryapplicationmain", entryapplicationmainEntity.getBillno(), params);

        entryapplicationmainEntity.setBillstatus(BillStatus.SUBMIT);
        entryapplicationmainEntity.setPocessinstanceid(processid);
        entryapplicationmainService.update(entryapplicationmainEntity);


        return R.ok();
    }


    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("entryapplicationmain:update")
    public R update(@RequestBody EntryapplicationmainEntity entryapplicationmain) {
        entryapplicationmainService.update(entryapplicationmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("entryapplicationmain:delete")
    public R delete(@RequestBody Long[] ids) {
        entryapplicationmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("entryapplicationmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            EntryapplicationmainEntity entryapplicationmainEntity = entryapplicationmainService.queryObject(attkey);
            if (entryapplicationmainEntity != null && entryapplicationmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                entryapplicationmainEntity.setBillstatus(BillStatus.CLAIM);
                entryapplicationmainService.update(entryapplicationmainEntity);

                //新增一条处理记录：签收
                newBillcomments(entryapplicationmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(entryapplicationmainEntity.getBillno());
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
    @RequiresPermissions("entryapplicationmain:audit")
    public R audit(@RequestBody EntryapplicationmainEntity entryapplicationmainEntity) {

        BillcommentsEntity billcommentsEntity = entryapplicationmainEntity.getBillcommentsEntity();
        entryapplicationmainEntity.setBillstatus(BillStatus.AUDIT);

        entryapplicationmainService.update(entryapplicationmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(entryapplicationmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(entryapplicationmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                entryapplicationmainEntity.setBillstatus(BillStatus.COMPLETE);
                entryapplicationmainService.update(entryapplicationmainEntity);
            }
        }

        return R.ok();
    }

}
