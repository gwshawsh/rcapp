package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BankEntity;

import java.util.List;
import java.util.Map;

/**
 * 银行管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:29
 */
public interface BankService {
	
	BankEntity queryObject(Long id);
	
	List<BankEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BankEntity bank);
	
	void update(BankEntity bank);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
