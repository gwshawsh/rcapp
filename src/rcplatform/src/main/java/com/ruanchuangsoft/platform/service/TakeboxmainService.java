package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 放箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-21 19:55:19
 */
public interface TakeboxmainService {
	
	TakeboxmainEntity queryObject(Long id);
	
	List<TakeboxmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TakeboxmainEntity takeboxmain);
	
	void update(TakeboxmainEntity takeboxmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
