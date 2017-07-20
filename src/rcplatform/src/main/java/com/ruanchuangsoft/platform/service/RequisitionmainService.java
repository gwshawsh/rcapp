package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RequisitionmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 请购单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-17 23:29:28
 */
public interface RequisitionmainService {
	
	RequisitionmainEntity queryObject(Long id);
	
	List<RequisitionmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RequisitionmainEntity requisitionmain);
	
	void update(RequisitionmainEntity requisitionmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);


    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
