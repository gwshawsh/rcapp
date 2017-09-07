package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.BillStatus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.enums.AuditType;
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

import com.ruanchuangsoft.platform.service.ContractmainService;
import com.ruanchuangsoft.platform.service.ContractdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 合同管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-25 20:40:35
 */
@Controller
@RequestMapping("contractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ContractmainController extends AbstractController {
	@Autowired
	private ContractmainService contractmainService;

    @Autowired
    private ContractdetailService contractdetailService;

    @RequestMapping("/contractmain")
	public String list(){
		return "contractmain/contractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/contractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("contractmain:list")
	public R list(Integer page, Integer limit,String billno){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("billno", billno);
        //map.put("userid",ShiroUtils.getUserId());//用来与工作流关联

		//查询列表数据
		List<ContractmainEntity> contractmainList = contractmainService.queryList(map);
		int total = contractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(contractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("contractmain:list")
    public R listdetail(String billno,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("billno",billno);


        //查询列表数据
        List<ContractdetailEntity> contractdetailList = contractdetailService.queryList(map);
        int total = contractdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(contractdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("contractmain:info")
	public R info(@PathVariable("id") Long id){
		ContractmainEntity contractmain = contractmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);

        List<ContractdetailEntity> contractdetailList = contractdetailService.queryList(map);
		contractmain.setDetails(contractdetailList );

		return R.ok().put("contractmain", contractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("contractmain:save")
	public R save(@RequestBody ContractmainEntity contractmain){
        if(contractmain.getBillno().equals("*")){
            String billno=getBillNo("CT");
			contractmain.setBillno(billno);
            contractmain.setBillstatus(BillStatus.NEW);
            if(contractmain.getDetails()!=null&&contractmain.getDetails().size()>0){
                for(ContractdetailEntity item:contractmain.getDetails()){
                    item.setBillno(billno);
                }
            }

            if(contractmain.getFiles()!=null&&contractmain.getFiles().size()>0){
                for(AttachmentsEntity item:contractmain.getFiles()){
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }

		contractmainService.save(contractmain);

		return R.ok();
	}

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("contractmain:update")
    public R submitworkflow(@RequestBody Long id){
        ContractmainEntity contractmainEntity=contractmainService.queryObject(id);
        if(contractmainEntity==null){
            return R.error("单据不存在，不能提交");
        }
        //启动工作流
        Map<String,Object> params=new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        params.put("type", contractmainEntity.getType());
        String processid=startWorkflow("ordermain",contractmainEntity.getBillno(),params);

        contractmainEntity.setBillstatus(BillStatus.SUBMIT);
        contractmainEntity.setPocessinstanceid(processid);
        contractmainService.update(contractmainEntity);


        return R.ok();
    }



    /**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("contractmain:update")
	public R update(@RequestBody ContractmainEntity contractmain){
		contractmainService.update(contractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("contractmain:delete")
	public R delete(@RequestBody Long[] ids){
		contractmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
    * 签收
    * 只有单据状态为提交状态的，才能够签收
    */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("contractmain:claim")
    public R claim(@RequestBody Long[] ids){

            for(Long attkey:ids){
                    ContractmainEntity contractmainEntity = contractmainService.queryObject(attkey);
                if (contractmainEntity != null && contractmainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    contractmainEntity.setBillstatus(BillStatus.CLAIM);
                    contractmainService.update(contractmainEntity);

                    //新增一条处理记录：签收
                    newBillcomments(contractmainEntity.getBillno(),"签收", AuditType.CLAIM);

                    //执行工作流的签收任务处理
                    Task task = getTaskByBussinessKey(contractmainEntity.getBillno());
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
    @RequiresPermissions("contractmain:audit")
    public R audit(@RequestBody ContractmainEntity contractmainEntity){

        BillcommentsEntity billcommentsEntity=contractmainEntity.getBillcommentsEntity();


        ContractmainEntity entity = contractmainService.queryObject(contractmainEntity.getId());
        Map<String,Object> mp = new HashMap<>();
        mp.put("billno",entity.getBillno());
        entity.setDetails(contractdetailService.queryList(mp));

        switch (entity.getBillstatus()){
            case BillStatus.REJECT:
                entity.setBillstatus(billcommentsEntity.isPass() ? BillStatus.REAPPLY : BillStatus.CANCLE);
                break;
            default:
                entity.setBillstatus(billcommentsEntity.isPass() ? BillStatus.AUDITING : BillStatus.REJECT);
                break;
        }

        contractmainService.update(entity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(entity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());



        //工作流处理
        Task task=getTaskByBussinessKey(entity.getBillno());
        if(task!=null){
            Map<String,Object> params=new HashMap<>();
            params.put("auditstatus",billcommentsEntity.getAuditstatus());
            completeTask(task,billcommentsEntity.getRemark(),params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag=isProcessEnd(task.getProcessInstanceId());
            if(endflag && entity.getBillstatus()!=BillStatus.CANCLE){
                    entity.setBillstatus(BillStatus.COMPLETE);
                    contractmainService.update(entity);
            }
        }

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("contractmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			contractmainService.unauditBatch(ids);

        return R.ok();
    }

}
