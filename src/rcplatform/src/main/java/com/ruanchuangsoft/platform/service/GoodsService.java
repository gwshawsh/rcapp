package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.GoodsEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-09 14:27:43
 */
public interface GoodsService {
	
	GoodsEntity queryObject(Long id);
	
	List<GoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(GoodsEntity goods);
	
	void update(GoodsEntity goods);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
