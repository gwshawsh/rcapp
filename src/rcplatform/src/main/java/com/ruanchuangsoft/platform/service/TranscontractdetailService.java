package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 运输合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:52:16
 */
public interface TranscontractdetailService {
	
	TranscontractdetailEntity queryObject(Long id);
	
	List<TranscontractdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TranscontractdetailEntity transcontractdetail);
	
	void update(TranscontractdetailEntity transcontractdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
