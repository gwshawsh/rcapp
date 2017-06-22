package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.StorecontractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 仓储合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:10:00
 */
public interface StorecontractmainService {
	
	StorecontractmainEntity queryObject(Long id);
	
	List<StorecontractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(StorecontractmainEntity storecontractmain);
	
	void update(StorecontractmainEntity storecontractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
