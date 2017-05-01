package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PlanKongxiangMainEntity;

import java.util.List;
import java.util.Map;

/**
 * 空箱计划用箱单主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-01 22:13:59
 */
public interface PlanKongxiangMainService {
	
	PlanKongxiangMainEntity queryObject(Long id);
	
	List<PlanKongxiangMainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PlanKongxiangMainEntity planKongxiangMain);
	
	void update(PlanKongxiangMainEntity planKongxiangMain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
