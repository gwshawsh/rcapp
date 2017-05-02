package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BoxsEntity;

import java.util.List;
import java.util.Map;

/**
 * 箱型基础信息表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-02 23:03:41
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
