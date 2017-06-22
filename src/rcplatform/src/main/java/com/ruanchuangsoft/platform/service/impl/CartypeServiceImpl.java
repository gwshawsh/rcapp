package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.CartypeDao;
import com.ruanchuangsoft.platform.entity.CartypeEntity;
import com.ruanchuangsoft.platform.service.CartypeService;
import org.springframework.transaction.annotation.Transactional;


@Service("cartypeService")
public class CartypeServiceImpl implements CartypeService {
	@Autowired
	private CartypeDao cartypeDao;
	
	@Override
	public CartypeEntity queryObject(Long id){
		return cartypeDao.queryObject(id);
	}
	
	@Override
	public List<CartypeEntity> queryList(Map<String, Object> map){
		return cartypeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return cartypeDao.queryTotal(map);
	}
	
	@Override
	public void save(CartypeEntity cartype){
		cartypeDao.save(cartype);
	}
	
	@Override
	public void update(CartypeEntity cartype){
		cartypeDao.update(cartype);
	}
	
	@Override
	public void delete(Long id){
		cartypeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		cartypeDao.deleteBatch(ids);
	}
	
}
