package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.GoodsDao;
import com.ruanchuangsoft.platform.entity.GoodsEntity;
import com.ruanchuangsoft.platform.service.GoodsService;
import org.springframework.transaction.annotation.Transactional;


@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public GoodsEntity queryObject(Long id){
		return goodsDao.queryObject(id);
	}
	
	@Override
	public List<GoodsEntity> queryList(Map<String, Object> map){
		return goodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return goodsDao.queryTotal(map);
	}
	
	@Override
	public void save(GoodsEntity goods){
		goodsDao.save(goods);
	}
	
	@Override
	public void update(GoodsEntity goods){
		goodsDao.update(goods);
	}
	
	@Override
	public void delete(Long id){
		goodsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		goodsDao.deleteBatch(ids);
	}
	
}
