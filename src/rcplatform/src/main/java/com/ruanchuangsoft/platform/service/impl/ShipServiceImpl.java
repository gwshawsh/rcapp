package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ShipDao;
import com.ruanchuangsoft.platform.entity.ShipEntity;
import com.ruanchuangsoft.platform.service.ShipService;
import org.springframework.transaction.annotation.Transactional;


@Service("shipService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ShipServiceImpl implements ShipService {
	@Autowired
	private ShipDao shipDao;
	
	@Override
	public ShipEntity queryObject(Long id){
		return shipDao.queryObject(id);
	}
	
	@Override
	public List<ShipEntity> queryList(Map<String, Object> map){
		return shipDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return shipDao.queryTotal(map);
	}
	
	@Override
	public void save(ShipEntity ship){
		shipDao.save(ship);
	}
	
	@Override
	public void update(ShipEntity ship){
		shipDao.update(ship);
	}
	
	@Override
	public void delete(Long id){
		shipDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		shipDao.deleteBatch(ids);
	}
	
}
