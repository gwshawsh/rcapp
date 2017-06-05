package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BaseOpBankEntity;

import java.util.List;
import java.util.Map;

/**
 * 银行表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-05 17:23:06
 */
public interface BaseOpBankService {
	
	BaseOpBankEntity queryObject(Integer bobTid);
	
	List<BaseOpBankEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BaseOpBankEntity baseOpBank);
	
	void update(BaseOpBankEntity baseOpBank);
	
	void delete(Integer bobTid);
	
	void deleteBatch(Integer[] bobTids);
}
