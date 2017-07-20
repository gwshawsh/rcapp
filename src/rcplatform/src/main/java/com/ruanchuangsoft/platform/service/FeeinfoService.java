package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.FeeinfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 费用项目
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-18 00:46:31
 */
public interface FeeinfoService {
	
	FeeinfoEntity queryObject(Long id);
	
	List<FeeinfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(FeeinfoEntity feeinfo);
	
	void update(FeeinfoEntity feeinfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
