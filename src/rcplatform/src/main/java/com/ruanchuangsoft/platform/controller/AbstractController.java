package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.entity.SysUserEntity;
import com.ruanchuangsoft.platform.service.AttachmentsService;
import com.ruanchuangsoft.platform.service.BillcommentsService;
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
 * @email sunlightcs @gmail.com
 * @date 2016年11月9日 下午9:42:26
 */
public abstract class AbstractController {

	/**
	 * Get request mapping string.
	 *
	 * @return the string
	 */
	public String getRequestMapping(){return "";};

	/**
	 * The Viewname.
	 */
//用来设置关联的页面文件
	public String viewname;

	/**
	 * Gets viewname.
	 *
	 * @return the viewname
	 */
	public String getViewname() {
		return viewname;
	}

	/**
	 * Sets viewname.
	 *
	 * @param viewname the viewname
	 */
	public void setViewname(String viewname) {
		this.viewname = viewname;
	}

	/**
	 * The Page values.
	 */
	public List<String> pageValues;

	/**
	 * The Message source.
	 */
	@Autowired
	public MessageSource messageSource;

	/**
	 * The Leavework service.
	 */
	@Autowired
	public LeaveworkService leaveworkService;

	/**
	 * The Identity service.
	 */
	@Autowired
	public IdentityService identityService;

	/**
	 * The Runtime service.
	 */
	@Autowired
	public RuntimeService runtimeService;

	/**
	 * The Task service.
	 */
	@Autowired
	public TaskService taskService;

	/**
	 * The History service.
	 */
	@Autowired
	public HistoryService historyService;

	/**
	 * The Redis service.
	 */
	@Autowired
	public IRedisService redisService;


	/**
	 * 查询审核备注
	 */
	@Autowired
	public BillcommentsService billcommentsService;

	@Autowired
	public AttachmentsService attachmentsService;

	/**
	 * The Logger.
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * Gets user.
	 *
	 * @return the user
	 */
	protected SysUserEntity getUser() {
		return ShiroUtils.getUserEntity();
	}

	/**
	 * Gets user id.
	 *
	 * @return the user id
	 */
	protected Long getUserId() {
		return getUser().getUserId();
	}


	/**
	 * Get model and view model and view.
	 *
	 * @return the model and view
	 */
//返回需要的视图模型类
	public ModelAndView getModelAndView(){
		ModelAndView view = new ModelAndView(getViewname());
		view.addObject("gUserName",ShiroUtils.getUserName());
		return view;
	}

	/**
	 * Init model and view i 18 n.
	 *
	 * @param view the view
	 * @param keys the keys
	 */
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


	/**
	 * Get workflow task list.
	 *
	 * @return the list
	 */
//返回当前查询使用的工作流的查询id
	public List<Task> getWorkflowTask(){
		List<Task> list=new ArrayList<>();
		List<Task> tasks=taskService.createTaskQuery().taskCandidateOrAssigned(ShiroUtils.getUserIdStr()).list();
		list.addAll(tasks);
		return list;

	}


	/**
	 * 根据taskId查找businessKey
	 *
	 * @param task the task
	 * @return the string
	 */
	public String getBusinessKeyByTaskId(Task task){
		ProcessInstance pi = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(task.getProcessInstanceId())
				.singleResult();
		return pi.getBusinessKey();
	}


	/**
	 * 根据业务单据号，查询对应的工作流任务
	 *
	 * @param key the key
	 * @return the list
	 */
	public Task getTaskByBussinessKey(String key){
		Task task=taskService.createTaskQuery().processInstanceBusinessKey(key).singleResult();
		return task;
	}


	/**
	 * 签收任务
	 *
	 * @param lstTask 需要签收的任务列表
	 */
	public void claimTasks(Task task){
			taskService.claim(task.getId(),String.valueOf(ShiroUtils.getUserId()));
	}

	/**
	 * 判断一个流程是否已经完成，用来在单据处理的时候，如果已经完成了
	 *
	 * @param processInstanceId the process instance id
	 * @return the boolean true 已经完成  false还未完成
	 */
	public boolean isProcessEnd(String processInstanceId) {
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		if (processInstance != null)
			return processInstance.isEnded();
		return true;
	}

	/**
	 * Complete task.
	 * 所有的流程需要在分支判断节点增加判断变量auditstatus
	 *
	 * @param task   the task
	 * @param params the params
	 */
	public void completeTask(Task task,String comments,Map<String,Object> params){
		if(task!=null) {
			taskService.addComment(task.getId(), null, comments);
			taskService.complete(task.getId(), params);
		}
	}



	/**
	 * Get workflow list query list.
	 *
	 * @return the list
	 */
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

	/**
	 * Start workflow string.
	 *
	 * @param processKey the process key
	 * @param bussKey    the buss key
	 * @param flowParams the flow params
	 * @return the string
	 */
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


	/**
	 * Get bill no string.
	 *
	 * @param billtype the billtype
	 * @return the string
	 */
	public String getBillNo(String billtype){
		Date date = DateUtil.date();
		String today= DateUtil.format(date,"yyyyMMdd");
		String key=billtype+today;
		Long orderno=redisService.incr(key);
		String serialno="000000"+String.valueOf(orderno);
		String billno=key+StrUtil.sub(serialno,serialno.length()-6,serialno.length());
		return billno;
	}


	/**
	 * 根据单据号查询审批备注.
	 *
	 * @param billno the billno
	 * @return the list
	 */
	public List<BillcommentsEntity> getBillcomments(String billno){
		Map<String,Object> map=new HashMap<>();
		map.put("billno",billno);
		return billcommentsService.queryList(map);
	}
}
