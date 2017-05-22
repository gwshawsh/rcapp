package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TodolistEntity;

import java.util.List;
import java.util.Map;

/**
 * 待办事项
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-17 12:11:08
 */
public interface TodolistService {
	
	TodolistEntity queryObject(Long id);
	
	List<TodolistEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TodolistEntity todolist);
	
	void update(TodolistEntity todolist);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
