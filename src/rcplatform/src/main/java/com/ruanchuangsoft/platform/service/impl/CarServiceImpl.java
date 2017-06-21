package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.CarDao;
import com.ruanchuangsoft.platform.entity.CarEntity;
import com.ruanchuangsoft.platform.service.CarService;
import org.springframework.transaction.annotation.Transactional;


@Service("carService")
public class CarServiceImpl implements CarService {
	@Autowired
	private CarDao carDao;
	
	@Override
	public CarEntity queryObject(Long id){
		return carDao.queryObject(id);
	}
	
	@Override
	public List<CarEntity> queryList(Map<String, Object> map){
		return carDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return carDao.queryTotal(map);
	}
	
	@Override
	public void save(CarEntity car){
		carDao.save(car);
	}
	
	@Override
	public void update(CarEntity car){
		carDao.update(car);
	}
	
	@Override
	public void delete(Long id){
		carDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		carDao.deleteBatch(ids);
	}
	
}
