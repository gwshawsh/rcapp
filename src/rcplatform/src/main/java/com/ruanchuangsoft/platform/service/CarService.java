package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.CarEntity;

import java.util.List;
import java.util.Map;

/**
 * 车辆管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public interface CarService {
	
	CarEntity queryObject(Long id);
	
	List<CarEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CarEntity car);
	
	void update(CarEntity car);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
