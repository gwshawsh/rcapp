package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.SysUserEntity;
import com.ruanchuangsoft.platform.service.IRedisService;
import com.ruanchuangsoft.platform.service.LeaveworkService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import com.xiaoleilu.hutool.date.DateUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Controller公共组件
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月9日 下午9:42:26
 */
public abstract class AbstractController {

	public String getRequestMapping(){return "";};

	//用来设置关联的页面文件
	public String viewname;

	public String getViewname() {
		return viewname;
	}

	public void setViewname(String viewname) {
		this.viewname = viewname;
	}

	public List<String> pageValues;

	@Autowired
	public MessageSource messageSource;

	@Autowired
	public LeaveworkService leaveworkService;

	@Autowired
	public IdentityService identityService;

	@Autowired
	public RuntimeService runtimeService;

	@Autowired
	public TaskService taskService;

	@Autowired
	public HistoryService historyService;

	@Autowired
	public IRedisService redisService;

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	protected SysUserEntity getUser() {
		return ShiroUtils.getUserEntity();
	}

	protected Long getUserId() {
		return getUser().getUserId();
	}



	//返回需要的视图模型类
	public ModelAndView getModelAndView(){
		ModelAndView view = new ModelAndView(getViewname());
		view.addObject("gUserName",ShiroUtils.getUserName());
		return view;
	}

	//根据传入的国际化key,初始化视图内容
	public void initModelAndViewI18N(ModelAndView view,String[] keys){
		if(keys==null||view==null){
			return;
		}
		Locale local= LocaleContextHolder.getLocale();

		for (String key :
				keys) {
			String value=messageSource.getMessage(key,null,local);
			view.addObject(key,value);
		}

	}



	//返回当前查询使用的工作流的查询id
	public List<Task> getWorkflowTask(){
		List<Task> list=new ArrayList<>();
		List<Task> tasks=taskService.createTaskQuery().taskCandidateOrAssigned(ShiroUtils.getUserIdStr()).list();
		list.addAll(tasks);
		return list;

	}


	/**
	 * 根据taskId查找businessKey
	 */
	public String getBusinessKeyByTaskId(Task task){
		ProcessInstance pi = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(task.getProcessInstanceId())
				.singleResult();
		return pi.getBusinessKey();
	}


	//返回当前查询使用的工作流的查询id
	public List<String> getWorkflowListQuery(){

		List<String> list=new ArrayList<>();
		List<Task> tasks=taskService.createTaskQuery().taskCandidateOrAssigned(ShiroUtils.getUserIdStr()).list();
		for (Task task:tasks
				) {
			list.add(task.getProcessInstanceId());
		}
		//查询自己创建的任务
		List<Task> tasks2=taskService.createTaskQuery().taskAssignee(ShiroUtils.getUserIdStr()).list();
		for (Task task:tasks
				) {
			list.add(task.getProcessInstanceId());
		}


		return list;

	}

	//启动工作流
	//启动工作流,需要接受工作流中条件跳转的参数,同时还需要接受单据业务相关的数据,方便进行数据关联查询
	//bussKey是用来区分唯一单据的键值,一般用来存储单据号
	//flowParams:用来存储工作流中流程跳转需要的数据
	//
	public String startWorkflow(String processKey,String bussKey,Map<String,Object> flowParams){

		//启动审批工作流
		identityService.setAuthenticatedUserId(String.valueOf(ShiroUtils.getUserId()));
		ProcessInstance processInstance=runtimeService.startProcessInstanceByKey(processKey,bussKey,flowParams);
		String processid= processInstance.getId();

		return processid;
	}


	public String getBillNo(String billtype){
		Date date = DateUtil.date();
		String today= DateUtil.format(date,"yyyyMMdd");
		String key=billtype+today;
		Long orderno=redisService.incr(key);
		String serialno="000000"+String.valueOf(orderno);
		String billno=key+StrUtil.sub(serialno,serialno.length()-6,serialno.length());
		return billno;
	}
}
