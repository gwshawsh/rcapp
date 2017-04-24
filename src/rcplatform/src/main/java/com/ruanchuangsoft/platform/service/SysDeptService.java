package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.SysDeptEntity;

import java.util.List;
import java.util.Map;

/**
 * 部门管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-04-18 21:22:26
 */
public interface SysDeptService {
	
	SysDeptEntity queryObject(Long deptId);
	
	List<SysDeptEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysDeptEntity sysDept);
	
	void update(SysDeptEntity sysDept);
	
	void delete(Long deptId);
	
	void deleteBatch(Long[] deptIds);
}
