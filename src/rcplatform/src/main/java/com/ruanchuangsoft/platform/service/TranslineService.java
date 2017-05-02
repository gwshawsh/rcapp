package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TranslineEntity;

import java.util.List;
import java.util.Map;

/**
 * 线路基础信息表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-02 23:01:31
 */
public interface TranslineService {
	
	TranslineEntity queryObject(Long id);
	
	List<TranslineEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TranslineEntity transline);
	
	void update(TranslineEntity transline);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
