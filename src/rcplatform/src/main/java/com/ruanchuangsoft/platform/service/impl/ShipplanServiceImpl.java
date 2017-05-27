package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ShipplanDao;
import com.ruanchuangsoft.platform.entity.ShipplanEntity;
import com.ruanchuangsoft.platform.service.ShipplanService;
import org.springframework.transaction.annotation.Transactional;


@Service("shipplanService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ShipplanServiceImpl implements ShipplanService {
	@Autowired
	private ShipplanDao shipplanDao;
	
	@Override
	public ShipplanEntity queryObject(Long id){
		return shipplanDao.queryObject(id);
	}
	
	@Override
	public List<ShipplanEntity> queryList(Map<String, Object> map){
		return shipplanDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return shipplanDao.queryTotal(map);
	}
	
	@Override
	public void save(ShipplanEntity shipplan){
		shipplanDao.save(shipplan);
	}
	
	@Override
	public void update(ShipplanEntity shipplan){
		shipplanDao.update(shipplan);
	}
	
	@Override
	public void delete(Long id){
		shipplanDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		shipplanDao.deleteBatch(ids);
	}
	
}
