package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.AccountcategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 预算科目
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 09:15:02
 */
public interface AccountcategoryService {
	
	AccountcategoryEntity queryObject(Long id);
	
	List<AccountcategoryEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(AccountcategoryEntity accountcategory);
	
	void update(AccountcategoryEntity accountcategory);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
