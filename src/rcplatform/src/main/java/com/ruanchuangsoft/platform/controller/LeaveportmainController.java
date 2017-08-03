package com.ruanchuangsoft.platform.controller;

import java.util.*;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
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

import com.ruanchuangsoft.platform.service.LeaveportmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 疏港计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-28 09:03:24
 */
@Controller
@RequestMapping("leaveportmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class LeaveportmainController extends AbstractController {
    @Autowired
    private LeaveportmainService leaveportmainService;

    @Autowired
    private TransboxmainService transboxmainService;

    @RequestMapping("/leaveportmain")
    public String list() {
        return "leaveportmain/leaveportmain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/leaveportmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("leaveportmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                LeaveportmainEntity param = JSON.parseObject(tmpquery, LeaveportmainEntity.class);
                if (param.getId() != null)
                    map.put("id", param.getId());
                if (param.getBillno() != null)
                    map.put("billno", param.getBillno());
                if (param.getOrgid() != null)
                    map.put("orgid", param.getOrgid());
                if (param.getLadingcode() != null)
                    map.put("ladingcode", param.getLadingcode());
                if (param.getShipname() != null)
                    map.put("shipname", param.getShipname());
                if (param.getFlight() != null)
                    map.put("flight", param.getFlight());
                if (param.getPortid() != null)
                    map.put("portid", param.getPortid());
                if (param.getShipcompany() != null)
                    map.put("shipcompany", param.getShipcompany());
                if (param.getBoxqty() != null)
                    map.put("boxqty", param.getBoxqty());
                if (param.getBoxtype() != null)
                    map.put("boxtype", param.getBoxtype());
                if (param.getTakeboxplaceid() != null)
                    map.put("takeboxplaceid", param.getTakeboxplaceid());
                if (param.getEndplaceid() != null)
                    map.put("endplaceid", param.getEndplaceid());
                if (param.getPlanarrporttime() != null)
                    map.put("planarrporttime", param.getPlanarrporttime());
                if (param.getPlanarrtime() != null)
                    map.put("planarrtime", param.getPlanarrtime());
                if (param.getRemark() != null)
                    map.put("remark", param.getRemark());
                if (param.getBillstatus() != null)
                    map.put("billstatus", param.getBillstatus());
                if (param.getMakeuser() != null)
                    map.put("makeuser", param.getMakeuser());
                if (param.getMakedate() != null)
                    map.put("makedate", param.getMakedate());
                if (param.getAccuser() != null)
                    map.put("accuser", param.getAccuser());
                if (param.getAccdate() != null)
                    map.put("accdate", param.getAccdate());
                if (param.getUptdate() != null)
                    map.put("uptdate", param.getUptdate());

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<LeaveportmainEntity> leaveportmainList = leaveportmainService.queryList(map);
        int total = leaveportmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(leaveportmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("leaveportmain:info")
    public R info(@PathVariable("id") Long id) {
        LeaveportmainEntity leaveportmain = leaveportmainService.queryObject(id);

        return R.ok().put("leaveportmain", leaveportmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("leaveportmain:save")
    public R save(@RequestBody LeaveportmainEntity leaveportmain) {
        if (leaveportmain.getBillno().equals("*")) {
            String billno = getBillNo("**");
            leaveportmain.setBillno(billno);
            leaveportmain.setBillstatus(BillStatus.NEW);


            if (leaveportmain.getFiles() != null && leaveportmain.getFiles().size() > 0) {
                for (AttachmentsEntity item : leaveportmain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        leaveportmainService.save(leaveportmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("leaveportmain:update")
    public R submitworkflow(@RequestBody Long id) {
        LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(id);
        if (leaveportmainEntity == null) {
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
    @RequiresPermissions("leaveportmain:update")
    public R update(@RequestBody LeaveportmainEntity leaveportmain) {
        leaveportmainService.update(leaveportmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("leaveportmain:delete")
    public R delete(@RequestBody Long[] ids) {
        leaveportmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("leaveportmain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(attkey);
            if (leaveportmainEntity != null && leaveportmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                leaveportmainEntity.setBillstatus(BillStatus.CLAIM);
                leaveportmainService.update(leaveportmainEntity);

                //新增一条处理记录：签收
                newBillcomments(leaveportmainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(leaveportmainEntity.getBillno());
                if (task != null) {
                    claimTasks(task);
                }
            }
        }


        return R.ok();
    }

    /**
     * 审核审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("leaveportmain:audit")
    public R audit(@RequestBody LeaveportmainEntity pleaveportmainEntity) {
        LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(pleaveportmainEntity.getId());
        if (leaveportmainEntity != null) {
            if (leaveportmainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                return R.error(1, "单据已经审核,不能重复审核");
            }
            BillcommentsEntity billcommentsEntity = leaveportmainEntity.getBillcommentsEntity();
            leaveportmainEntity.setBillstatus(BillStatus.AUDIT);

            leaveportmainService.update(leaveportmainEntity);


            //生成审核日志
            //新增一条处理记录：审核
            newBillcomments(leaveportmainEntity.getBillno(),
                    billcommentsEntity.getRemark(),
                    billcommentsEntity.getAuditstatus());


            leaveportmainEntity.setBillstatus(BillStatus.AUDIT);
            leaveportmainEntity.setAccdate(new Date());
            leaveportmainEntity.setAccuser(ShiroUtils.getUserId());
            leaveportmainEntity.setUptdate(new Date());
            leaveportmainService.update(leaveportmainEntity);


            //生成运输计划主表
            TransboxmainEntity transboxmainEntity = new TransboxmainEntity();
            String billno = getBillNo("TS");
            transboxmainEntity.setBillno(billno);
            transboxmainEntity.setRefbillno(leaveportmainEntity.getBillno());
            transboxmainEntity.setRefbilltype(TranBillType.LEAVEPORT);
            transboxmainEntity.setEndplaceid(leaveportmainEntity.getEndplaceid());
            transboxmainEntity.setLadingcode(leaveportmainEntity.getLadingcode());
            transboxmainEntity.setShipname(leaveportmainEntity.getShipname());
            transboxmainEntity.setFlight(leaveportmainEntity.getFlight());
            transboxmainEntity.setPortid(leaveportmainEntity.getPortid());
            transboxmainEntity.setBoxqty(leaveportmainEntity.getBoxqty());
            transboxmainEntity.setBoxtype(leaveportmainEntity.getBoxtype());
            transboxmainEntity.setTakeboxplaceid(leaveportmainEntity.getTakeboxplaceid());
            transboxmainEntity.setBgnplanarrtime(leaveportmainEntity.getPlanarrporttime());
            transboxmainEntity.setEndplanarrtime(leaveportmainEntity.getPlanarrtime());
            transboxmainEntity.setMakedate(new Date());
            transboxmainEntity.setMakeuser(String.valueOf(ShiroUtils.getUserId()));
            transboxmainEntity.setUptdate(new Date());
            List<TransboxdetailEntity> lstTransDetail = new ArrayList<>();
            for (int i = 0; i < leaveportmainEntity.getBoxqty(); i++) {

                TransboxdetailEntity tsDetail = new TransboxdetailEntity();
                tsDetail.setBillno(billno);
                tsDetail.setBillno(billno);
                tsDetail.setSerialno((long) i);
                tsDetail.setBoxno("");
                tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
                tsDetail.setStartplaceid1(leaveportmainEntity.getTakeboxplaceid());
                tsDetail.setStartplaceid2(leaveportmainEntity.getTakeboxplaceid());
                tsDetail.setEndplaceid(leaveportmainEntity.getEndplaceid());
                tsDetail.setUptdate(new Date());
                lstTransDetail.add(tsDetail);

            }
            transboxmainEntity.setDetails(lstTransDetail);
            transboxmainService.save(transboxmainEntity);

            //工作流处理
            Task task = getTaskByBussinessKey(leaveportmainEntity.getBillno());
            if (task != null) {
                Map<String, Object> params = new HashMap<>();
                params.put("auditstatus", billcommentsEntity.getAuditstatus());
                completeTask(task, billcommentsEntity.getRemark(), params);
                //检查工作流是否结束，如果结束，则设置单据状态为已完成
                boolean endflag = isProcessEnd(task.getProcessInstanceId());
                if (endflag) {
                    leaveportmainEntity.setBillstatus(BillStatus.COMPLETE);
                    leaveportmainService.update(leaveportmainEntity);
                }
            }

        }


        return R.ok();
    }


    /**
     * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("leaveportmain:audit")
    public R unaudit(@RequestBody Long[] ids) {
        for (long id : ids) {
            LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(id);
            if (leaveportmainEntity != null) {
                if (leaveportmainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                leaveportmainEntity.setBillstatus(BillStatus.NEW);
                leaveportmainEntity.setAccdate(new Date());
                leaveportmainEntity.setAccuser(ShiroUtils.getUserId());
                leaveportmainEntity.setUptdate(new Date());
                leaveportmainService.update(leaveportmainEntity);

                //查找已经生成的运输任务
                //transboxmainService.queryObject()
                Map<String, Object> map = new HashMap<>();

                map.put("refbillno", leaveportmainEntity.getBillno());
                map.put("refbilltype", TranBillType.HEAVYBILL);
                List<TransboxmainEntity> tmpListTransbox = transboxmainService.queryList(map);
                if (tmpListTransbox != null && tmpListTransbox.size() > 0) {
                    for (TransboxmainEntity item : tmpListTransbox) {
                        transboxmainService.delete(item.getId());
                    }
                }


            }
        }


        return R.ok();
    }

}
