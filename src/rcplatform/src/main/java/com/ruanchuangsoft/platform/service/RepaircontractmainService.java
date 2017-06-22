package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RepaircontractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 机械维修合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
public interface RepaircontractmainService {
	
	RepaircontractmainEntity queryObject(Long id);
	
	List<RepaircontractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RepaircontractmainEntity repaircontractmain);
	
	void update(RepaircontractmainEntity repaircontractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
