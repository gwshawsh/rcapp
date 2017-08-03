package com.ruanchuangsoft.platform.controller;

import java.util.*;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.service.FactorymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 门点计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
@Controller
@RequestMapping("factorymain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class FactorymainController extends AbstractController {
    @Autowired
    private FactorymainService factorymainService;

    @Autowired
    private TransboxmainService transboxmainService;

    @RequestMapping("/factorymain")
    public String list() {
        return "factorymain/factorymain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/factorymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("factorymain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                FactorymainEntity param = JSON.parseObject(tmpquery, FactorymainEntity.class);
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
                if (param.getBoxqty() != null)
                    map.put("boxqty", param.getBoxqty());
                if (param.getBoxtype() != null)
                    map.put("boxtype", param.getBoxtype());
                if (param.getTakeboxplaceid() != null)
                    map.put("takeboxplaceid", param.getTakeboxplaceid());
                if (param.getEndplaceid() != null)
                    map.put("endplaceid", param.getEndplaceid());
                if (param.getBackplaceid() != null)
                    map.put("backplaceid", param.getBackplaceid());
                if (param.getBgnshipdatetime() != null)
                    map.put("bgnshipdatetime", param.getBgnshipdatetime());
                if (param.getEndshipdatetime() != null)
                    map.put("endshipdatetime", param.getEndshipdatetime());
                if (param.getBgnplanarrtime() != null)
                    map.put("bgnplanarrtime", param.getBgnplanarrtime());
                if (param.getEndplanarrtime() != null)
                    map.put("endplanarrtime", param.getEndplanarrtime());
                if (param.getFengxiangtime() != null)
                    map.put("fengxiangtime", param.getFengxiangtime());
                if (param.getBaoguantime() != null)
                    map.put("baoguantime", param.getBaoguantime());
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
        List<FactorymainEntity> factorymainList = factorymainService.queryList(map);
        int total = factorymainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(factorymainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("factorymain:info")
    public R info(@PathVariable("id") Long id) {
        FactorymainEntity factorymain = factorymainService.queryObject(id);

        return R.ok().put("factorymain", factorymain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("factorymain:save")
    public R save(@RequestBody FactorymainEntity factorymain) {
        if (factorymain.getBillno().equals("*")) {
            String billno = getBillNo("FC");
            factorymain.setBillno(billno);
            factorymain.setBillstatus(BillStatus.NEW);


            if (factorymain.getFiles() != null && factorymain.getFiles().size() > 0) {
                for (AttachmentsEntity item : factorymain.getFiles()) {
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }


        factorymainService.save(factorymain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("factorymain:update")
    public R submitworkflow(@RequestBody Long id) {
        FactorymainEntity factorymainEntity = factorymainService.queryObject(id);
        if (factorymainEntity == null) {
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
    @RequiresPermissions("factorymain:update")
    public R update(@RequestBody FactorymainEntity factorymain) {
        factorymainService.update(factorymain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("factorymain:delete")
    public R delete(@RequestBody Long[] ids) {
        factorymainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 签收
     * 只有单据状态为提交状态的，才能够签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("factorymain:claim")
    public R claim(@RequestBody Long[] ids) {

        for (Long attkey :
                ids) {
            FactorymainEntity factorymainEntity = factorymainService.queryObject(attkey);
            if (factorymainEntity != null && factorymainEntity.getBillstatus() == BillStatus.SUBMIT) {
                factorymainEntity.setBillstatus(BillStatus.CLAIM);
                factorymainService.update(factorymainEntity);

                //新增一条处理记录：签收
                newBillcomments(factorymainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(factorymainEntity.getBillno());
                if (task != null) {
                    claimTasks(task);
                }
            }
        }


        return R.ok();
    }


    /**
     * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("factorymain:audit")
    public R audit(@RequestBody FactorymainEntity pfactorymainEntity) {
        FactorymainEntity factorymainEntity = factorymainService.queryObject(pfactorymainEntity.getId());
        if (factorymainEntity != null) {
            if (factorymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                return R.error(1, "单据已经审核,不能重复审核");
            }

            BillcommentsEntity billcommentsEntity = pfactorymainEntity.getBillcommentsEntity();
            factorymainEntity.setBillstatus(BillStatus.AUDIT);

            factorymainService.update(factorymainEntity);


            //生成审核日志
            //新增一条处理记录：审核
            newBillcomments(factorymainEntity.getBillno(),
                    billcommentsEntity.getRemark(),
                    billcommentsEntity.getAuditstatus());



            factorymainEntity.setBillstatus(BillStatus.AUDIT);
            factorymainEntity.setAccdate(new Date());
            factorymainEntity.setAccuser(ShiroUtils.getUserId());
            factorymainEntity.setUptdate(new Date());
            factorymainService.update(factorymainEntity);


            //生成运输计划主表
            TransboxmainEntity transboxmainEntity = new TransboxmainEntity();
            String billno = getBillNo("TS");
            transboxmainEntity.setBillno(billno);
            transboxmainEntity.setRefbillno(factorymainEntity.getBillno());
            transboxmainEntity.setRefbilltype(TranBillType.FACTORYBILL);
            transboxmainEntity.setEndplaceid(factorymainEntity.getEndplaceid());
            transboxmainEntity.setLadingcode("");
            transboxmainEntity.setShipname("");
            transboxmainEntity.setFlight("");
            transboxmainEntity.setPortid(factorymainEntity.getPortid());
            transboxmainEntity.setBoxqty(factorymainEntity.getBoxqty());
            transboxmainEntity.setBoxtype(factorymainEntity.getBoxtype());
            transboxmainEntity.setTakeboxplaceid(factorymainEntity.getTakeboxplaceid());
            transboxmainEntity.setBgnplanarrtime(factorymainEntity.getBgnplanarrtime());
            transboxmainEntity.setEndplanarrtime(factorymainEntity.getEndplanarrtime());
            transboxmainEntity.setMakedate(new Date());
            transboxmainEntity.setMakeuser(String.valueOf(ShiroUtils.getUserId()));
            transboxmainEntity.setUptdate(new Date());
            List<TransboxdetailEntity> lstTransDetail = new ArrayList<>();
            for (int i = 0; i < factorymainEntity.getBoxqty(); i++) {

                TransboxdetailEntity tsDetail = new TransboxdetailEntity();
                tsDetail.setBillno(billno);
                tsDetail.setBillno(billno);
                tsDetail.setSerialno((long) i);
                tsDetail.setBoxno("");
                tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
                tsDetail.setStartplaceid1(factorymainEntity.getTakeboxplaceid());
                tsDetail.setStartplaceid2(factorymainEntity.getTakeboxplaceid());
                tsDetail.setEndplaceid(factorymainEntity.getEndplaceid());
                tsDetail.setUptdate(new Date());
                lstTransDetail.add(tsDetail);

            }
            transboxmainEntity.setDetails(lstTransDetail);
            transboxmainService.save(transboxmainEntity);


            //工作流处理
            Task task = getTaskByBussinessKey(factorymainEntity.getBillno());
            if (task != null) {
                Map<String, Object> params = new HashMap<>();
                params.put("auditstatus", billcommentsEntity.getAuditstatus());
                completeTask(task, billcommentsEntity.getRemark(), params);
                //检查工作流是否结束，如果结束，则设置单据状态为已完成
                boolean endflag = isProcessEnd(task.getProcessInstanceId());
                if (endflag) {
                    factorymainEntity.setBillstatus(BillStatus.COMPLETE);
                    factorymainService.update(factorymainEntity);
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
    @RequiresPermissions("factorymain:audit")
    public R unaudit(@RequestBody Long[] ids) {
        for (long id : ids) {
            FactorymainEntity factorymainEntity = factorymainService.queryObject(id);
            if (factorymainEntity != null) {
                if (factorymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                factorymainEntity.setBillstatus(BillStatus.NEW);
                factorymainEntity.setAccdate(new Date());
                factorymainEntity.setAccuser(ShiroUtils.getUserId());
                factorymainEntity.setUptdate(new Date());
                factorymainService.update(factorymainEntity);

                //查找已经生成的运输任务
                //transboxmainService.queryObject()
                Map<String, Object> map = new HashMap<>();

                map.put("refbillno", factorymainEntity.getBillno());
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
