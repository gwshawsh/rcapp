package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BoctypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 币别
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
public interface BoctypeService {
	
	BoctypeEntity queryObject(Long id);
	
	List<BoctypeEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BoctypeEntity boctype);
	
	void update(BoctypeEntity boctype);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
