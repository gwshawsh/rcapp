package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PaycircleEntity;

import java.util.List;
import java.util.Map;

/**
 * 结算周期
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 16:49:45
 */
public interface PaycircleService {
	
	PaycircleEntity queryObject(Long id);
	
	List<PaycircleEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PaycircleEntity paycircle);
	
	void update(PaycircleEntity paycircle);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
