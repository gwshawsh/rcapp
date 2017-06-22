package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RentcontractmainDao;
import com.ruanchuangsoft.platform.entity.RentcontractmainEntity;
import com.ruanchuangsoft.platform.service.RentcontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("rentcontractmainService")
public class RentcontractmainServiceImpl implements RentcontractmainService {
	@Autowired
	private RentcontractmainDao rentcontractmainDao;
	
	@Override
	public RentcontractmainEntity queryObject(Long id){
		return rentcontractmainDao.queryObject(id);
	}
	
	@Override
	public List<RentcontractmainEntity> queryList(Map<String, Object> map){
		return rentcontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return rentcontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(RentcontractmainEntity rentcontractmain){
		rentcontractmainDao.save(rentcontractmain);
	}
	
	@Override
	public void update(RentcontractmainEntity rentcontractmain){
		rentcontractmainDao.update(rentcontractmain);
	}
	
	@Override
	public void delete(Long id){
		rentcontractmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		rentcontractmainDao.deleteBatch(ids);
	}
	
}
