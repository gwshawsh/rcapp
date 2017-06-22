package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 机械维修合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
public interface RepaircontractdetailService {
	
	RepaircontractdetailEntity queryObject(Long id);
	
	List<RepaircontractdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RepaircontractdetailEntity repaircontractdetail);
	
	void update(RepaircontractdetailEntity repaircontractdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
