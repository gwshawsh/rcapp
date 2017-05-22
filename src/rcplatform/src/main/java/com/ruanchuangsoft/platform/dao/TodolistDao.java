package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TodolistEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 待办事项
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-17 12:11:08
 */
@Mapper
public interface TodolistDao extends BaseDao<TodolistEntity> {
	
}
