package com.ruanchuangsoft.platform.controller;

import java.util.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruanchuangsoft.platform.annotation.SysLog;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.entity.OrdermainEntity;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.service.OrdermainService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.TodolistEntity;
import com.ruanchuangsoft.platform.service.TodolistService;
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
	private OrdermainService ordermainService;

	@RequestMapping("/todolist")
	public String list(){
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
	public R list(Integer page, Integer limit){


		//读取工作流中分配给当前人员或者签收的任务
		List<Task> list= getWorkflowTask();
		//查询列表数据
		List<TodolistEntity> todolistList = new ArrayList<>();
		for(Task task:list){
			TodolistEntity entity=new TodolistEntity();
			entity.setTitle(task.getName());
			entity.setBilldate(task.getCreateTime());
			entity.setId(Long.parseLong(task.getId()));
			Map<String,Object> tmpdata=taskService.getVariables(task.getId());
			String billdata=(String)tmpdata.get("billdata");
			entity.setBilldata(billdata);
			entity.setHtmldata((String)tmpdata.get("htmldata"));
			todolistList.add(entity);

		}
		int total = list.size();

		PageUtils pageUtil = new PageUtils(todolistList, total, 20, 0);

		return R.ok().put("page", pageUtil);
	}




	/**
	 * 返回当前待办事项对应的功能url和billid
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("todolist:info")
	public R info(@PathVariable("id") Long id){
		TodolistEntity todolist=new TodolistEntity();
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
	public R save(@RequestBody TodolistEntity todolist){
		todolistService.save(todolist);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("todolist:update")
	public R update(@RequestBody TodolistEntity todolist){
		todolistService.update(todolist);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("todolist:delete")
	public R delete(@RequestBody Long[] ids){
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
		JSONObject obj=JSON.parseObject(data);
		String billno=obj.getString("billno");
		if(billno!=null&&billno.length()>2){
			String billtype=billno.substring(0,2);
			if(billtype.equalsIgnoreCase("OR")){
				OrdermainEntity ordermainEntity=JSON.parseObject(data,OrdermainEntity.class);
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
	 * 签收
	 */
	@ResponseBody
	@RequestMapping("/audit")
	@RequiresPermissions("ordermain:audit")
	public R audit(@RequestBody String data) {
		JSONObject obj=JSON.parseObject(data);
		String billno=obj.getString("billno");
		if(billno!=null&&billno.length()>2){
			String billtype=billno.substring(0,2);
			if(billtype.equalsIgnoreCase("OR")){
				OrdermainEntity ordermainEntity=JSON.parseObject(data,OrdermainEntity.class);
				ordermainEntity.setBillstatus(BillStatus.AUDIT);
				ordermainService.update(ordermainEntity);

				//新增一条处理记录：审核
				BillcommentsEntity billcommentsEntity=ordermainEntity.getBillcommentsEntity();
				newBillcomments(ordermainEntity.getBillno(),ordermainEntity.getBillcommentsEntity().getRemark(),billcommentsEntity.getAuditstatus());


				//执行工作流的签收任务处理
				Task task = getTaskByBussinessKey(ordermainEntity.getBillno());
				if(task!=null) {
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
			}
		}

		return R.ok();
	}

}
