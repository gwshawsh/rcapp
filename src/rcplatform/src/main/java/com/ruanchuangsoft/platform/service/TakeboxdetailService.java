package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 放箱计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 21:36:50
 */
public interface TakeboxdetailService {
	
	TakeboxdetailEntity queryObject(Long id);
	
	List<TakeboxdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TakeboxdetailEntity takeboxdetail);
	
	void update(TakeboxdetailEntity takeboxdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
