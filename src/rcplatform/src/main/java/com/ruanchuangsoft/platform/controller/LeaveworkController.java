package com.ruanchuangsoft.platform.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.annotation.SysLog;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.LeaveworkEntity;
import com.ruanchuangsoft.platform.service.LeaveworkService;
/**
 * 请假表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-03-26 17:42:15
 */
@Controller
@RequestMapping("leavework")
public class LeaveworkController extends AbstractController{


	@RequestMapping("/leavework")
	public String list(){

		return "webapp/modeler.html";
//		return "buss/leavework";
	}
	
	/**
	 * 列表
	 */
	@SysLog("查询请假列表")
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("leavework:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//读取工作流中分配给当前人员或者签收的任务
		List<String> list= getWorkflowListQuery();
		map.put("list",list);

		//查询列表数据
		List<LeaveworkEntity> leaveworkList = leaveworkService.queryList(map);
		int total = leaveworkService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(leaveworkList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@SysLog("查询请假")
	@ResponseBody
	@RequestMapping("/info/{leaveId}")
	@RequiresPermissions("leavework:info")
	public R info(@PathVariable("leaveId") Long leaveId){
		LeaveworkEntity leavework = leaveworkService.queryObject(leaveId);
		
		return R.ok().put("leavework", leavework);
	}
	
	/**
	 * 保存
	 */
	@SysLog("保存请假")
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("leavework:save")
	public R save(LeaveworkEntity leavework){
		//启动审批工作流
		Map<String,Object> params=new HashMap<>();
		params.put("userid",ShiroUtils.getUserId());
		params.put("funcurl",getRequestMapping());
		String processid=startWorkflow("leavework",String.valueOf(leavework.getLeaveId()),params);

		leavework.setUserId(ShiroUtils.getUserId());
		leavework.setName(ShiroUtils.getUserName());
		leavework.setPocessInstanceid(processid);
		leaveworkService.save(leavework);

		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@SysLog("修改请假")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("leavework:update")
	public R update(@RequestBody LeaveworkEntity leavework){
		leaveworkService.update(leavework);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@SysLog("删除请假")
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("leavework:delete")
	public R delete(@RequestBody Long[] leaveIds){
		leaveworkService.deleteBatch(leaveIds);
		
		return R.ok();
	}

	@Override
	public String getRequestMapping() {
		return "leavework/index";
	}



}
