package com.ruanchuangsoft.platform.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.annotation.SysLog;
import com.ruanchuangsoft.platform.controller.AbstractController;

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

	@RequestMapping("/todolist")
	public String list(){
		return "todolist/todolist";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("todolist/todolist");
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
			entity.setBilldate(task.getCreateTime());
			entity.setId(Long.parseLong(task.getId()));
			String busskey=getBusinessKeyByTaskId(task);
			if(busskey!=null&&busskey.length()>0){
				String[] array=busskey.split(":");
				if(array.length>1){
					entity.setTitle(array[0]);
					entity.setTodourl(array[1]);
					entity.setBilldata(array[2]);
				}
			}

		}
		int total = list.size();

		PageUtils pageUtil = new PageUtils(todolistList, total, limit, page);

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
}
