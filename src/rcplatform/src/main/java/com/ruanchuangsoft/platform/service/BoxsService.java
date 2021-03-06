package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BoxsEntity;

import java.util.List;
import java.util.Map;

/**
 * 箱型管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
public interface BoxsService {
	
	BoxsEntity queryObject(Long id);
	
	List<BoxsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BoxsEntity boxs);
	
	void update(BoxsEntity boxs);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
