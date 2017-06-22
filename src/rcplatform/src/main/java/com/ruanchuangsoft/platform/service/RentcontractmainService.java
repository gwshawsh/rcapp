package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RentcontractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 租赁合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:27:17
 */
public interface RentcontractmainService {
	
	RentcontractmainEntity queryObject(Long id);
	
	List<RentcontractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RentcontractmainEntity rentcontractmain);
	
	void update(RentcontractmainEntity rentcontractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
