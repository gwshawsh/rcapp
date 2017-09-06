package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruanchuangsoft.platform.annotation.SysLog;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.service.*;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 待办事项
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-17 12:11:08
 */
@Controller
@RequestMapping("todolist")
public class TodolistController extends AbstractController {
    @Autowired
    private TodolistService todolistService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RequisitionmainService requisitionmainService;

    @Autowired
    private OrdermainService ordermainService;

    @Autowired
    private PaymentmainService paymentmainService;

    @Autowired
    private ContractmainService contractmainService;

    @Autowired
    private LeaveworkmainService leaveworkmainService;

    @RequestMapping("/todolist")
    public String list() {
        return "todolist/todolist";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/todolist");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @SysLog("查询待办事项")
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("todolist:list")
    public R list(Integer page, Integer limit) {


        //读取工作流中分配给当前人员或者签收的任务
        List<Task> list = getWorkflowTask();
        //查询列表数据
        List<TodolistEntity> todolistList = new ArrayList<>();
        for (Task task : list) {
            TodolistEntity entity = new TodolistEntity();
            entity.setTitle(task.getName());
            entity.setBilldate(task.getCreateTime());
            entity.setId(Long.parseLong(task.getId()));
            Map<String, Object> tmpdata = taskService.getVariables(task.getId());
            String billdata = (String) tmpdata.get("billdata");
            entity.setBilldata(billdata);
            entity.setHtmldata((String) tmpdata.get("htmldata"));
            todolistList.add(entity);

        }
        int total = list.size();

        PageUtils pageUtil = new PageUtils(todolistList, total, 20, 0);

        return R.ok().put("page", pageUtil);
    }

    /**
     * 根据单据号查询审批备注.
     *
     * @param billno the billno
     * @return the list
     */
    @SysLog("手机查询待办事项备注")
    @ResponseBody
    @RequestMapping("/listcomments")
    public R getComments(String billno) {
        Map<String, Object> map = new HashMap<>();
        map.put("billno", billno);
        return R.ok().put("data",billcommentsService.queryList(map));

    }
    /**
     * 列表
     */
    @SysLog("手机查询查询待办事项数")
    @ResponseBody
    @RequestMapping("/listdotocount")
    public R listCount() {


        int order = getCandidateOrAssignedTasks("order").size();
        int leave = getCandidateOrAssignedTasks("leave").size();
        int ask = getCandidateOrAssignedTasks("ask").size();
        int contract = getCandidateOrAssignedTasks("contract").size();
        Map<String, Object> map = new HashMap<>();

        map.put("order", order);
        map.put("leave", leave);
        map.put("ask", ask);
        map.put("contract", contract);
        map.put("total", order + leave + ask + contract);
        return R.ok().put("data", map);
    }
    /**
     * 列表
     */
    @SysLog("手机查询查询待办事项")
    @ResponseBody
    @RequestMapping("/listdoto")
    public R list(@RequestBody TodoQueryParam param) {
        String billtype = param.getBilltype();
        Long userid = ShiroUtils.getUserId();
        Map<String, Object> map = new HashMap<>();

        int page = param.getPage();
        int limit = param.getLimit();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        //查询请购单审批任务

        //map.put("userid", ShiroUtils.getUserId());//用来与工作流关联
        map.put("billno", param.getBillno());//用来与工作流关联

        List<String> bussKeys = getCandidateOrAssignedBussKeys(billtype);//获取待办事项的对应的billno列表
        if(bussKeys.isEmpty()){//无当前类型的待办事项
            return R.ok();
        }
        map.put("billnos", bussKeys);

        if (billtype.equalsIgnoreCase("ask")) {
            List<RequisitionmainEntity> list = requisitionmainService.queryList(map);
            int total = list.size();
            PageUtils pageUtil = new PageUtils(list, total, param.getLimit(), param.getPage());
            return R.ok().put("page", pageUtil);
        }
        //查询订购单审批任务
        else if (billtype.equalsIgnoreCase("order")) {

            List<OrdermainEntity> list = ordermainService.queryList(map);
            int total = list.size();
            PageUtils pageUtil = new PageUtils(list, total, param.getLimit(), param.getPage());
            return R.ok().put("page", pageUtil);
        }
        //查询付款单审批任务
        else if (billtype.equalsIgnoreCase("pay")) {
            List<PaymentmainEntity> list = paymentmainService.queryList(map);
            int total = list.size();
            PageUtils pageUtil = new PageUtils(list, total, param.getLimit(), param.getPage());
            return R.ok().put("page", pageUtil);
        }
        //查询合同审批任务
        else if (billtype.equalsIgnoreCase("contract")) {
            List<ContractmainEntity> list = contractmainService.queryList(map);
            int total = list.size();
            PageUtils pageUtil = new PageUtils(list, total, param.getLimit(), param.getPage());
            return R.ok().put("page", pageUtil);
        } else if (billtype.equalsIgnoreCase("leave")) {
            List<LeaveworkmainEntity> list = leaveworkmainService.queryList(map);
            int total = list.size();
            PageUtils pageUtil = new PageUtils(list, total, param.getLimit(), param.getPage());
            return R.ok().put("page", pageUtil);
        } else {
            return R.error("无法处理请求");
        }
    }

    @SysLog("手机审批待办事项")
    @ResponseBody
    @RequestMapping("/audittodo")
    public R audit(@RequestBody TodoAuditParam param) {
        Task task = getTaskByBussinessKey(param.getBillno());
        if (task == null) {
            return R.error("任务不存在");
        }

        Map<String, Object> params = new HashMap<>();
        params.put("audittype", param.getAudittype());
        completeTask(task, param.getComments(), params);
        //检查工作流是否结束，如果结束，则设置单据状态为已完成
        boolean endflag = isProcessEnd(task.getProcessInstanceId());
        int billStatus = endflag ? BillStatus.COMPLETE : BillStatus.AUDITING;

        Map<String, Object> map = new HashMap<>();
        map.put("billno", param.getBillno());//用来与工作流关联

        switch (param.getBilltype()) {
            case "leave": {
                List<LeaveworkmainEntity> list = leaveworkmainService.queryList(map);
                if (list.isEmpty()) {
                    return R.error("单据不存在");
                }
                LeaveworkmainEntity entity = list.get(0);
                entity.setBillstatus(billStatus);
                leaveworkmainService.update(entity);
            }
            break;
            case "ask": {
                List<RequisitionmainEntity> list = requisitionmainService.queryList(map);
                if (list.isEmpty()) {
                    return R.error("单据不存在");
                }
                RequisitionmainEntity entity = list.get(0);
                entity.setBillstatus(billStatus);
                requisitionmainService.update(entity);
                break;
            }
            case "order": {
                List<OrdermainEntity> list = ordermainService.queryList(map);
                if (list.isEmpty()) {
                    return R.error("单据不存在");
                }
                OrdermainEntity entity = list.get(0);
                entity.setBillstatus(billStatus);
                ordermainService.update(entity);
                break;
            }
            case "contract": {
                List<ContractmainEntity> list = contractmainService.queryList(map);
                if (list.isEmpty()) {
                    return R.error("单据不存在");
                }
                ContractmainEntity entity = list.get(0);
                entity.setBillstatus(billStatus);
                contractmainService.update(entity);
            }
                break;
            case "pay": {
                List<PaymentmainEntity> list = paymentmainService.queryList(map);
                if (list.isEmpty()) {
                    return R.error("单据不存在");
                }
                PaymentmainEntity entity = list.get(0);
                entity.setBillstatus(billStatus);
                paymentmainService.update(entity);
            }
                break;
        }
        return R.ok();

    }


    /**
     * 返回当前待办事项对应的功能url和billid
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("todolist:info")
    public R info(@PathVariable("id") Long id) {
        TodolistEntity todolist = new TodolistEntity();
//		String busskey=getBusinessKeyByTaskId(String.valueOf(id));
//		if(busskey.indexOf(":")>0){
//			String[] array=busskey.split(":");
//			if(array.length>1){
//				todolist.setTitle(array[0]);
//				todolist.setTodourl(array[1]);
//				todolist.setBilldata(array[2]);
//			}
//		}

        return R.ok().put("todolist", todolist);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("todolist:save")
    public R save(@RequestBody TodolistEntity todolist) {
        todolistService.save(todolist);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("todolist:update")
    public R update(@RequestBody TodolistEntity todolist) {
        todolistService.update(todolist);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("todolist:delete")
    public R delete(@RequestBody Long[] ids) {
        todolistService.deleteBatch(ids);

        return R.ok();
    }

    @Override
    public String getRequestMapping() {
        return "todolist/index";
    }


    /**
     * 签收
     */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("ordermain:claim")
    public R claim(@RequestBody String data) {
        JSONObject obj = JSON.parseObject(data);
        String billno = obj.getString("billno");
        if (billno != null && billno.length() > 2) {
            String billtype = billno.substring(0, 2);
            if (billtype.equalsIgnoreCase("OR")) {
                OrdermainEntity ordermainEntity = JSON.parseObject(data, OrdermainEntity.class);
                ordermainEntity.setBillstatus(BillStatus.CLAIM);
                ordermainService.update(ordermainEntity);

                //新增一条处理记录：签收
                newBillcomments(ordermainEntity.getBillno(), "签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(ordermainEntity.getBillno());
                if (task != null) {
                    claimTasks(task);
                }
            }
        }

        return R.ok();
    }


    /**
     * 签收
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("ordermain:audit")
    public R audit(@RequestBody String data) {
        JSONObject obj = JSON.parseObject(data);
        String billno = obj.getString("billno");
        if (billno != null && billno.length() > 2) {
            String billtype = billno.substring(0, 2);
            if (billtype.equalsIgnoreCase("OR")) {
                OrdermainEntity ordermainEntity = JSON.parseObject(data, OrdermainEntity.class);
                ordermainEntity.setBillstatus(BillStatus.AUDITING);
                ordermainService.update(ordermainEntity);

                //新增一条处理记录：审核
                BillcommentsEntity billcommentsEntity = ordermainEntity.getBillcommentsEntity();
                newBillcomments(ordermainEntity.getBillno(),
                        ordermainEntity.getBillcommentsEntity().getRemark(),
                        billcommentsEntity.getAuditstatus());


                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(ordermainEntity.getBillno());
                if (task != null) {
                    Map<String, Object> params = new HashMap<>();
                    params.put("auditstatus", billcommentsEntity.getAuditstatus());
                    completeTask(task, billcommentsEntity.getRemark(), params);
                    //检查工作流是否结束，如果结束，则设置单据状态为已完成
                    boolean endflag = isProcessEnd(task.getProcessInstanceId());
                    if (endflag) {
                        ordermainEntity.setBillstatus(BillStatus.COMPLETE);
                        ordermainService.update(ordermainEntity);
                    }
                }
            }
        }

        return R.ok();
    }

}
