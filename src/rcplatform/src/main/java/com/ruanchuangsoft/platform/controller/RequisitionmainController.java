package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.enums.BillStatus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.enums.BillStatus;
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

import com.ruanchuangsoft.platform.entity.RequisitionmainEntity;
import com.ruanchuangsoft.platform.service.RequisitionmainService;
import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import com.ruanchuangsoft.platform.service.RequisitiondetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请购单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 00:21:21
 */
@Controller
@RequestMapping("requisitionmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RequisitionmainController extends AbstractController {
	@Autowired
	private RequisitionmainService requisitionmainService;

    @Autowired
    private RequisitiondetailService requisitiondetailService;

    @RequestMapping("/requisitionmain")
	public String list(){
		return "requisitionmain/requisitionmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/requisitionmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("requisitionmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
        map.put("userid", ShiroUtils.getUserId());//用来与工作流关联

		//查询列表数据
		List<RequisitionmainEntity> requisitionmainList = requisitionmainService.queryList(map);
		int total = requisitionmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(requisitionmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("requisitionmain:list")
    public R listdetail(String billno,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("billno",billno);


        //查询列表数据
        List<RequisitiondetailEntity> requisitiondetailList = requisitiondetailService.queryList(map);
        int total = requisitiondetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(requisitiondetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("requisitionmain:info")
	public R info(@PathVariable("id") Long id){
		RequisitionmainEntity requisitionmain = requisitionmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);

        List<RequisitiondetailEntity> requisitiondetailList = requisitiondetailService.queryList(map);
		requisitionmain.setDetails(requisitiondetailList );

		return R.ok().put("requisitionmain", requisitionmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("requisitionmain:save")
	public R save(@RequestBody RequisitionmainEntity requisitionmain){
        if(requisitionmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			requisitionmain.setBillno(billno);
            requisitionmain.setBillstatus(BillStatus.NEW);
            if(requisitionmain.getDetails()!=null&&requisitionmain.getDetails().size()>0){
                for(RequisitiondetailEntity item:requisitionmain.getDetails()){
                    item.setBillno(billno);
                }
            }

            if(requisitionmain.getFiles()!=null&&requisitionmain.getFiles().size()>0){
                for(AttachmentsEntity item:requisitionmain.getFiles()){
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }

		requisitionmainService.save(requisitionmain);

		return R.ok();
	}

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("requisitionmain:update")
    public R submitworkflow(@RequestBody Long id){
        RequisitionmainEntity requisitionmainEntity=requisitionmainService.queryObject(id);
        if(requisitionmainEntity==null){
            return R.error("单据不存在，不能提交");
        }
        //启动工作流
        Map<String,Object> params=new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        String processid=startWorkflow("requisitionmain",requisitionmainEntity.getBillno(),params);

        requisitionmainEntity.setBillstatus(BillStatus.SUBMIT);
        requisitionmainEntity.setPocessinstanceid(processid);
        requisitionmainService.update(requisitionmainEntity);


        return R.ok();
    }



    /**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("requisitionmain:update")
	public R update(@RequestBody RequisitionmainEntity requisitionmain){
		requisitionmainService.update(requisitionmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("requisitionmain:delete")
	public R delete(@RequestBody Long[] ids){
		requisitionmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
    * 签收
    * 只有单据状态为提交状态的，才能够签收
    */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("requisitionmain:claim")
    public R claim(@RequestBody Long[] ids){

            for(Long attkey:ids){
                    RequisitionmainEntity requisitionmainEntity = requisitionmainService.queryObject(attkey);
                if (requisitionmainEntity != null && requisitionmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    requisitionmainEntity.setBillstatus(BillStatus.CLAIM);
                    requisitionmainService.update(requisitionmainEntity);

                    //新增一条处理记录：签收
                    newBillcomments(requisitionmainEntity.getBillno(),"签收", AuditType.CLAIM);

                    //执行工作流的签收任务处理
                    Task task = getTaskByBussinessKey(requisitionmainEntity.getBillno());
                    if(task!=null) {
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
    @RequiresPermissions("requisitionmain:audit")
    public R audit(@RequestBody RequisitionmainEntity requisitionmainEntity){

        BillcommentsEntity billcommentsEntity=requisitionmainEntity.getBillcommentsEntity();
        requisitionmainEntity.setBillstatus(BillStatus.AUDIT);

        requisitionmainService.update(requisitionmainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(requisitionmainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());



        //工作流处理
        Task task=getTaskByBussinessKey(requisitionmainEntity.getBillno());
        if(task!=null){
            Map<String,Object> params=new HashMap<>();
            params.put("auditstatus",billcommentsEntity.getAuditstatus());
            completeTask(task,billcommentsEntity.getRemark(),params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag=isProcessEnd(task.getProcessInstanceId());
            if(endflag){
                    requisitionmainEntity.setBillstatus(BillStatus.COMPLETE);
                    requisitionmainService.update(requisitionmainEntity);
            }
        }

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("requisitionmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			requisitionmainService.unauditBatch(ids);

        return R.ok();
    }

}
