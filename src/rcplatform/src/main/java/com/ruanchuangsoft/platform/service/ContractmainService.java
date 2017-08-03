package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ContractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 合同管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-25 20:40:35
 */
public interface ContractmainService {
	
	ContractmainEntity queryObject(Long id);
	
	List<ContractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContractmainEntity contractmain);
	
	void update(ContractmainEntity contractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);


    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
