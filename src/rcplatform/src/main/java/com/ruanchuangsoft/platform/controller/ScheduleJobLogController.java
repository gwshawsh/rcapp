package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.ScheduleJobLogEntity;
import com.ruanchuangsoft.platform.service.ScheduleJobLogService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时任务日志
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月1日 下午10:39:52
 */
@RestController
@RequestMapping("/sys/scheduleLog")
public class ScheduleJobLogController {
	@Autowired
	private ScheduleJobLogService scheduleJobLogServiceImpl;
	
	/**
	 * 定时任务日志列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:log")
	public R list(Integer page, Integer limit, Integer jobId){
		Map<String, Object> map = new HashMap<>();
		map.put("jobId", jobId);
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<ScheduleJobLogEntity> jobList = scheduleJobLogServiceImpl.queryList(map);
		int total = scheduleJobLogServiceImpl.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(jobList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	/**
	 * 定时任务日志信息
	 */
	@RequestMapping("/info/{logId}")
	public R info(@PathVariable("logId") Long logId){
		ScheduleJobLogEntity log = scheduleJobLogServiceImpl.queryObject(logId);
		
		return R.ok().put("log", log);
	}
}
