package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TransteamEntity;

import java.util.List;
import java.util.Map;

/**
 * 车队管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:33:23
 */
public interface TransteamService {
	
	TransteamEntity queryObject(Long id);
	
	List<TransteamEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TransteamEntity transteam);
	
	void update(TransteamEntity transteam);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
