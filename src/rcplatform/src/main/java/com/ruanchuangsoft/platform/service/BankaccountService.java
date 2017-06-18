package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BankaccountEntity;

import java.util.List;
import java.util.Map;

/**
 * 银行账户表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
public interface BankaccountService {
	
	BankaccountEntity queryObject(Long id);
	
	List<BankaccountEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BankaccountEntity bankaccount);
	
	void update(BankaccountEntity bankaccount);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
