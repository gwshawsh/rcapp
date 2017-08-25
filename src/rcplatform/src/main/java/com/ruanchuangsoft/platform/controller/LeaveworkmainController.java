package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
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

import com.ruanchuangsoft.platform.entity.LeaveworkmainEntity;
import com.ruanchuangsoft.platform.service.LeaveworkmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请假单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-24 09:00:21
 */
@Controller
@RequestMapping("leaveworkmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class LeaveworkmainController extends AbstractController {
    @Autowired
    private LeaveworkmainService leaveworkmainService;

    @RequestMapping("/leaveworkmain")
    public String list() {
        return "leaveworkmain/leaveworkmain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/leaveworkmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("leaveworkmain:list")
    public R list(@RequestBody Map<String, Object> map) {

        Integer limit = (Integer) map.getOrDefault("limit",100);
        Integer page = (Integer) map.getOrDefault("page",1);
        map.put("offset", (page - 1) * limit);
        map.put("limit",limit);


        //查询列表数据
        List<LeaveworkmainEntity> leaveworkmainList = leaveworkmainService.queryList(map);
        int total = leaveworkmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(leaveworkmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("leaveworkmain:info")
    public R info(@PathVariable("id") Long id) {
        LeaveworkmainEntity leaveworkmain = leaveworkmainService.queryObject(id);

        return R.ok().put("leaveworkmain", leaveworkmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("leaveworkmain:save")
    public R save(@RequestBody LeaveworkmainEntity leaveworkmain) {
        if (leaveworkmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            leaveworkmain.setBillno(billno);
            leaveworkmain.setBillstatus(BillStatus.NEW);
            leaveworkmain.setUserid(ShiroUtils.getUserId());

            if (leaveworkmain.getFiles() != null && leaveworkmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : leaveworkmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        leaveworkmainService.save(leaveworkmain);

        return R.ok().put("billno",leaveworkmain.getBillno());
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("leaveworkmain:update")
    public R submitworkflow(@RequestBody Long id) {
        LeaveworkmainEntity leaveworkmainEntity = leaveworkmainService.queryObject(id);
        if (leaveworkmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程

        Map<String, Object> params = new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid = startWorkflow("leavework", leaveworkmainEntity.getBillno(), params);

        leaveworkmainEntity.setBillstatus(BillStatus.SUBMIT);
        leaveworkmainEntity.setPocessinstanceid(processid);
        leaveworkmainService.update(leaveworkmainEntity);


        return R.ok();
    }

    /**
     * 手机端保存并提交到workflow
     */
    @Transactional
    @ResponseBody
    @RequestMapping("/savesubmit")
    @RequiresPermissions("leaveworkmain:update")
    public R saveAndSubmit(@RequestBody LeaveworkmainEntity leaveworkmain) {
        String billno = (String) save(leaveworkmain).get("billno");
        Map<String,Object> map = new HashMap<>();
        map.put("billno",billno);
        List<LeaveworkmainEntity> list = leaveworkmainService.queryList(map);
        if(list.isEmpty()){
            return R.error("提交单据失败");
        }

        return submitworkflow(list.get(0).getId());
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("leaveworkmain:update")
    public R update(@RequestBody LeaveworkmainEntity leaveworkmain) {
        leaveworkmainService.update(leaveworkmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("leaveworkmain:delete")
    public R delete(@RequestBody Long[] ids) {
        leaveworkmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("leaveworkmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            LeaveworkmainEntity leaveworkmainEntity = leaveworkmainService.queryObject(attkey);
            if (leaveworkmainEntity != null && leaveworkmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                leaveworkmainEntity.setBillstatus(BillStatus.CLAIM);
                leaveworkmainService.update(leaveworkmainEntity);

                //新增一条处理记录：签收
                newBillcomments(leaveworkmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(leaveworkmainEntity.getBillno());
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
    @RequiresPermissions("leaveworkmain:audit")
    public R audit(@RequestBody LeaveworkmainEntity leaveworkmainEntity) {

        BillcommentsEntity billcommentsEntity = leaveworkmainEntity.getBillcommentsEntity();
        leaveworkmainEntity.setBillstatus(BillStatus.AUDIT);

        leaveworkmainService.update(leaveworkmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(leaveworkmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(leaveworkmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                leaveworkmainEntity.setBillstatus(BillStatus.COMPLETE);
                leaveworkmainService.update(leaveworkmainEntity);
            }
        }

        return R.ok();
    }

}
