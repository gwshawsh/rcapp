package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 采购合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
public interface BuycontractdetailService {
	
	BuycontractdetailEntity queryObject(Long id);
	
	List<BuycontractdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BuycontractdetailEntity buycontractdetail);
	
	void update(BuycontractdetailEntity buycontractdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
