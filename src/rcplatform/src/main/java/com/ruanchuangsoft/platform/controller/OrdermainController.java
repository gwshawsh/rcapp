package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.*;
import com.ruanchuangsoft.platform.enums.BillStatus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.enums.RefBillType;
import com.ruanchuangsoft.platform.service.ContractmainService;
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

import com.ruanchuangsoft.platform.service.OrdermainService;
import com.ruanchuangsoft.platform.service.OrderdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订购单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-23 17:35:42
 */
@Controller
@RequestMapping("ordermain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class OrdermainController extends AbstractController {
	@Autowired
	private OrdermainService ordermainService;

    @Autowired
    private OrderdetailService orderdetailService;

    @Autowired
    private ContractmainService contractmainService;

    @RequestMapping("/ordermain")
	public String list(){
		return "ordermain/ordermain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/ordermain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("ordermain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
        map.put("userid",ShiroUtils.getUserId());//用来与工作流关联

		//查询列表数据
		List<OrdermainEntity> ordermainList = ordermainService.queryList(map);
		int total = ordermainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(ordermainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("ordermain:list")
    public R listdetail(String billno,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("billno",billno);


        //查询列表数据
        List<OrderdetailEntity> orderdetailList = orderdetailService.queryList(map);
        int total = orderdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(orderdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("ordermain:info")
	public R info(@PathVariable("id") Long id){
		OrdermainEntity ordermain = ordermainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("billno",ordermain.getBillno());

        List<OrderdetailEntity> orderdetailList = orderdetailService.queryList(map);
		ordermain.setDetails(orderdetailList );

		return R.ok().put("ordermain", ordermain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("ordermain:save")
	public R save(@RequestBody OrdermainEntity ordermain){
        if(ordermain.getBillno().equals("*")){
            String billno=getBillNo("**");
			ordermain.setBillno(billno);
            ordermain.setBillstatus(BillStatus.NEW);
            if(ordermain.getDetails()!=null&&ordermain.getDetails().size()>0){
                for(OrderdetailEntity item:ordermain.getDetails()){
                    item.setBillno(billno);
                }
            }

            if(ordermain.getFiles()!=null&&ordermain.getFiles().size()>0){
                for(AttachmentsEntity item:ordermain.getFiles()){
                    item.setBillno(billno);
                    attachmentsService.update(item);
                }
            }
        }

		ordermainService.save(ordermain);

		return R.ok();
	}

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("ordermain:update")
    public R submitworkflow(@RequestBody Long id){
        OrdermainEntity ordermainEntity=ordermainService.queryObject(id);
        if(ordermainEntity==null){
            return R.error("单据不存在，不能提交");
        }
        //启动工作流
        Map<String,Object> params=new HashMap<>();
        params.put("userid", ShiroUtils.getUserId());
        params.put("type", "order");
        String processid=startWorkflow("ordermain",ordermainEntity.getBillno(),params);

        ordermainEntity.setBillstatus(BillStatus.SUBMIT);
        ordermainEntity.setPocessinstanceid(processid);
        ordermainService.update(ordermainEntity);


        return R.ok();
    }



    /**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("ordermain:update")
	public R update(@RequestBody OrdermainEntity ordermain){
		ordermainService.update(ordermain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("ordermain:delete")
	public R delete(@RequestBody Long[] ids){
		ordermainService.deleteBatch(ids);

		return R.ok();
	}

    /**
    * 签收
    * 只有单据状态为提交状态的，才能够签收
    */
    @ResponseBody
    @RequestMapping("/claim")
    @RequiresPermissions("ordermain:claim")
    public R claim(@RequestBody Long[] ids){

            for(Long attkey:ids){
                    OrdermainEntity ordermainEntity = ordermainService.queryObject(attkey);
                if (ordermainEntity != null && ordermainEntity.getBillstatus() == BillStatus.SUBMIT) {
                    ordermainEntity.setBillstatus(BillStatus.CLAIM);
                    ordermainService.update(ordermainEntity);

                    //新增一条处理记录：签收
                    newBillcomments(ordermainEntity.getBillno(),"签收", AuditType.CLAIM);

                    //执行工作流的签收任务处理
                    Task task = getTaskByBussinessKey(ordermainEntity.getBillno());
                    if(task!=null) {
                        claimTasks(task);
                    }
                }
            }


        return R.ok();
    }

    /**
     * 审核,生成合同单据
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("ordermain:audit")
    public R audit(@RequestBody OrdermainEntity ordermainEntity){

        BillcommentsEntity billcommentsEntity=ordermainEntity.getBillcommentsEntity();
        ordermainEntity.setBillstatus(BillStatus.AUDITING);

        ordermainService.update(ordermainEntity);


        //生成审核日志
        //新增一条处理记录：审核
        newBillcomments(ordermainEntity.getBillno(),
                billcommentsEntity.getRemark(),
                billcommentsEntity.getAuditstatus());


        ContractmainEntity contractmainEntity=new ContractmainEntity();
        String conbillno=getBillNo("CT");
        contractmainEntity.setBillno(conbillno);
        contractmainEntity.setOrderbillno(ordermainEntity.getBillno());
        contractmainEntity.setBillsource(RefBillType.ORDERBILL);
        contractmainEntity.setMakeuser(ShiroUtils.getUserId());
        List<ContractdetailEntity> list=new ArrayList<>();
        for(OrderdetailEntity item:ordermainEntity.getDetails()){
            ContractdetailEntity citem=new ContractdetailEntity();
            citem.setBillno(conbillno);
            citem.setGoodsid(item.getGoodsid());
            citem.setGoodscount(item.getGoodscount());
            citem.setGoodsprice(item.getGoodsprice());
            citem.setGoodscount(item.getGoodscount());
            citem.setGoodsuse(item.getGoodsuse());

            list.add(citem);

        }
        contractmainEntity.setDetails(list);
        contractmainService.save(contractmainEntity);



        //工作流处理
        Task task=getTaskByBussinessKey(ordermainEntity.getBillno());
        if(task!=null){
            Map<String,Object> params=new HashMap<>();
            params.put("auditstatus",billcommentsEntity.getAuditstatus());
            completeTask(task,billcommentsEntity.getRemark(),params);
            //检查工作流是否结束，如果结束，则设置单据状态为已完成
            boolean endflag=isProcessEnd(task.getProcessInstanceId());
            if(endflag){
                    ordermainEntity.setBillstatus(BillStatus.COMPLETE);
                    ordermainService.update(ordermainEntity);
            }
        }

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("ordermain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			ordermainService.unauditBatch(ids);

        return R.ok();
    }

}
