package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PortEntity;

import java.util.List;
import java.util.Map;

/**
 * 港口管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:14:43
 */
public interface PortService {
	
	PortEntity queryObject(Long id);
	
	List<PortEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PortEntity port);
	
	void update(PortEntity port);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
