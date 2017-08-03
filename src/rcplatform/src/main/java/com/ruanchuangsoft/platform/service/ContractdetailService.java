package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ContractdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-25 20:40:35
 */
public interface ContractdetailService {
	
	ContractdetailEntity queryObject(Long id);
	
	List<ContractdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContractdetailEntity contractdetail);
	
	void update(ContractdetailEntity contractdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
