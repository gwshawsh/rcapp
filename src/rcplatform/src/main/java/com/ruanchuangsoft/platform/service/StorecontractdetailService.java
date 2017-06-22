package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 仓储合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:07:01
 */
public interface StorecontractdetailService {
	
	StorecontractdetailEntity queryObject(Long id);
	
	List<StorecontractdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(StorecontractdetailEntity storecontractdetail);
	
	void update(StorecontractdetailEntity storecontractdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
