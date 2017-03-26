package com.ruanchuangsoft.platform.buss.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.activiti.engine.IdentityService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.system.entity.LeaveworkEntity;
import com.ruanchuangsoft.platform.buss.service.LeaveworkService;
/**
 * 请假表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-03-26 17:42:15
 */
@Controller
@RequestMapping("leavework")
public class LeaveworkController {
	@Autowired
	private LeaveworkService leaveworkService;

	@Autowired
	private IdentityService identityService;
	
	@RequestMapping("/leavework")
	public String list(){
		return "buss/leavework";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("leavework:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<LeaveworkEntity> leaveworkList = leaveworkService.queryList(map);
		int total = leaveworkService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(leaveworkList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
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
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("leavework:save")
	public R save(@RequestBody LeaveworkEntity leavework){
		leavework.setUserId(ShiroUtils.getUserId());
		leavework.setName(ShiroUtils.getUserName());
		leaveworkService.save(leavework);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
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
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("leavework:delete")
	public R delete(@RequestBody Long[] leaveIds){
		leaveworkService.deleteBatch(leaveIds);
		
		return R.ok();
	}
	
}
