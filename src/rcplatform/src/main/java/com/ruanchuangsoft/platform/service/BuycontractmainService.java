package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BuycontractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 采购合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
public interface BuycontractmainService {
	
	BuycontractmainEntity queryObject(Long id);
	
	List<BuycontractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BuycontractmainEntity buycontractmain);
	
	void update(BuycontractmainEntity buycontractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
