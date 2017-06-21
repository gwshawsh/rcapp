package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TranslineEntity;

import java.util.List;
import java.util.Map;

/**
 * 线路管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
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
