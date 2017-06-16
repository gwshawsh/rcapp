package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.CostcategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 费用科目
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-06 12:43:24
 */
public interface CostcategoryService {
	
	CostcategoryEntity queryObject(Long id);
	
	List<CostcategoryEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CostcategoryEntity costcategory);
	
	void update(CostcategoryEntity costcategory);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
