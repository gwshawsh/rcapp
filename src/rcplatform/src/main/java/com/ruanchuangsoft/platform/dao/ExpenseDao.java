package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.ExpenseEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 报销管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 13:27:49
 */
@Mapper
public interface ExpenseDao extends BaseDao<ExpenseEntity> {
	
}
