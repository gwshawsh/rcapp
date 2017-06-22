package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 运输计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:37:11
 */
public interface TransboxdetailService {
	
	TransboxdetailEntity queryObject(Long id);
	
	List<TransboxdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TransboxdetailEntity transboxdetail);
	
	void update(TransboxdetailEntity transboxdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
