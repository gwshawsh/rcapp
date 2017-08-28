package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
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

import com.ruanchuangsoft.platform.entity.FormalapplicationmainEntity;
import com.ruanchuangsoft.platform.service.FormalapplicationmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 转正申请
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-14 13:36:29
 */
@Controller
@RequestMapping("formalapplicationmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class FormalapplicationmainController extends AbstractController {
    @Autowired
    private FormalapplicationmainService formalapplicationmainService;

    @RequestMapping("/formalapplicationmain")
    public String list() {
        return "formalapplicationmain/formalapplicationmain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("member/formalapplicationmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("formalapplicationmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    FormalapplicationmainEntity param = JSON.parseObject(tmpquery, FormalapplicationmainEntity.class);
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
                                    map.put("englishname", param.getEnglishname());
                                    map.put("userid", param.getUserid());
                                    map.put("password", param.getPassword());
                                    map.put("email", param.getEmail());
                                    map.put("brithday", param.getBrithday());
                                    map.put("englishlevel", param.getEnglishlevel());
                                    map.put("graduationtime", param.getGraduationtime());
                                    map.put("residence", param.getResidence());
                                    map.put("census", param.getCensus());
                                    map.put("educationexperience", param.getEducationexperience());
                                    map.put("workexperience", param.getWorkexperience());
                                    map.put("family", param.getFamily());
                                    map.put("mobile", param.getMobile());
                                    map.put("startedworktime", param.getStartedworktime());
                                    map.put("gender", param.getGender());
                                    map.put("nationality", param.getNationality());
                                    map.put("computerlevel", param.getComputerlevel());
                                    map.put("major", param.getMajor());
                                    map.put("thermobile", param.getThermobile());
                                    map.put("vacationyear", param.getVacationyear());
                                    map.put("vacationlastyear", param.getVacationlastyear());
                                    map.put("identification", param.getIdentification());
                                    map.put("qulification", param.getQulification());
                                    map.put("marriage", param.getMarriage());
                                    map.put("academictitle", param.getAcademictitle());
                                    map.put("school", param.getSchool());
                                    map.put("status", param.getStatus());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<FormalapplicationmainEntity> formalapplicationmainList = formalapplicationmainService.queryList(map);
        int total = formalapplicationmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(formalapplicationmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("formalapplicationmain:info")
    public R info(@PathVariable("id") Long id) {
            FormalapplicationmainEntity formalapplicationmain = formalapplicationmainService.queryObject(id);

        return R.ok().put("formalapplicationmain", formalapplicationmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("formalapplicationmain:save")
    public R save(@RequestBody FormalapplicationmainEntity formalapplicationmain) {
                        if(formalapplicationmain.getBillno().equals("*")){
                  String billno=getBillNo("**");
                formalapplicationmain.setBillno(billno);
                formalapplicationmain.setBillstatus(BillStatus.NEW);


                  if(formalapplicationmain.getFiles()!=null&&formalapplicationmain.getFiles().size()>0){
                      for(AttachmentsEntity item:formalapplicationmain.getFiles()){
                          item.setBillno(billno);
                          attachmentsService.update(item);
                      }
                  }
              }


                      formalapplicationmainService.save(formalapplicationmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("formalapplicationmain:update")
    public R submitworkflow(@RequestBody Long id) {
            FormalapplicationmainEntity formalapplicationmainEntity = formalapplicationmainService.queryObject(id);
        if (formalapplicationmainEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                                                                                                                                                                                                                                        
                Map<String, Object> params = new HashMap<>();
                params.put("userid", ShiroUtils.getUserId());
                String processid = startWorkflow("formalapplicationmain", formalapplicationmainEntity.getBillno(), params);

                    formalapplicationmainEntity.setBillstatus(BillStatus.SUBMIT);
                    formalapplicationmainEntity.setPocessinstanceid(processid);
                    formalapplicationmainService.update(formalapplicationmainEntity);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("formalapplicationmain:update")
    public R update(@RequestBody FormalapplicationmainEntity formalapplicationmain) {
            formalapplicationmainService.update(formalapplicationmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("formalapplicationmain:delete")
    public R delete(@RequestBody Long[]ids) {
            formalapplicationmainService.deleteBatch(ids);

        return R.ok();
    }


       /**
   * 签收
   * 只有单据状态为提交状态的，才能够签收
   */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("formalapplicationmain:claim")
    public R claim(@RequestBody Long[]ids) {

        for (Long attkey:
                                ids) {
                FormalapplicationmainEntity formalapplicationmainEntity = formalapplicationmainService.queryObject(attkey);
            if (formalapplicationmainEntity != null && formalapplicationmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    formalapplicationmainEntity.setBillstatus(BillStatus.CLAIM);
                    formalapplicationmainService.update(formalapplicationmainEntity);

                //新增一条处理记录：签收
                newBillcomments(formalapplicationmainEntity.getBillno(),"签收", AuditType.CLAIM);

                //执行工作流的签收任务处理
                Task task = getTaskByBussinessKey(formalapplicationmainEntity.getBillno());
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
    @RequiresPermissions("formalapplicationmain:audit")
    public R audit(@RequestBody FormalapplicationmainEntity formalapplicationmainEntity) {

        BillcommentsEntity billcommentsEntity = formalapplicationmainEntity.getBillcommentsEntity();
            formalapplicationmainEntity.setBillstatus(BillStatus.AUDITING);

            formalapplicationmainService.update(formalapplicationmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(formalapplicationmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());

        //工作流处理
        Task task = getTaskByBussinessKey(formalapplicationmainEntity.getBillno());
        if (task != null) {
            Map<String, Object> params = new HashMap<>();
            params.put("auditstatus", billcommentsEntity.getAuditstatus());
            completeTask(task, billcommentsEntity.getRemark(), params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag = isProcessEnd(task.getProcessInstanceId());
            if (endflag) {
                    formalapplicationmainEntity.setBillstatus(BillStatus.COMPLETE);
                    formalapplicationmainService.update(formalapplicationmainEntity);
            }
        }

        return R.ok();
    }
   
}
