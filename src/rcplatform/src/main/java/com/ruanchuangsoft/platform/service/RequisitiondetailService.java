package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 请购明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-17 15:16:21
 */
public interface RequisitiondetailService {
	
	RequisitiondetailEntity queryObject(Long id);
	
	List<RequisitiondetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RequisitiondetailEntity requisitiondetail);
	
	void update(RequisitiondetailEntity requisitiondetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
