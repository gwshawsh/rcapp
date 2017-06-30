package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BillcommentsEntity;

import java.util.List;
import java.util.Map;

/**
 * 单据审批备注
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-28 16:16:47
 */
public interface BillcommentsService {
	
	BillcommentsEntity queryObject(Long id);
	
	List<BillcommentsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BillcommentsEntity billcomments);
	
	void update(BillcommentsEntity billcomments);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
