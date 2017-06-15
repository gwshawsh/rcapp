package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.OrderdetailDao;
import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import com.ruanchuangsoft.platform.service.OrderdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("orderdetailService")
public class OrderdetailServiceImpl implements OrderdetailService {
	@Autowired
	private OrderdetailDao orderdetailDao;
	
	@Override
	public OrderdetailEntity queryObject(Long id){
		return orderdetailDao.queryObject(id);
	}
	
	@Override
	public List<OrderdetailEntity> queryList(Map<String, Object> map){
		return orderdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return orderdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(OrderdetailEntity orderdetail){
		orderdetailDao.save(orderdetail);
	}
	
	@Override
	public void update(OrderdetailEntity orderdetail){
		orderdetailDao.update(orderdetail);
	}
	
	@Override
	public void delete(Long id){
		orderdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		orderdetailDao.deleteBatch(ids);
	}
	
}
