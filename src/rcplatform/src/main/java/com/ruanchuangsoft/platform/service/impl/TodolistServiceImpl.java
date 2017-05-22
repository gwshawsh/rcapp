package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TodolistDao;
import com.ruanchuangsoft.platform.entity.TodolistEntity;
import com.ruanchuangsoft.platform.service.TodolistService;



@Service("todolistService")
public class TodolistServiceImpl implements TodolistService {
	@Autowired
	private TodolistDao todolistDao;
	
	@Override
	public TodolistEntity queryObject(Long id){
		return todolistDao.queryObject(id);
	}
	
	@Override
	public List<TodolistEntity> queryList(Map<String, Object> map){
		return todolistDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return todolistDao.queryTotal(map);
	}
	
	@Override
	public void save(TodolistEntity todolist){
		todolistDao.save(todolist);
	}
	
	@Override
	public void update(TodolistEntity todolist){
		todolistDao.update(todolist);
	}
	
	@Override
	public void delete(Long id){
		todolistDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		todolistDao.deleteBatch(ids);
	}
	
}
