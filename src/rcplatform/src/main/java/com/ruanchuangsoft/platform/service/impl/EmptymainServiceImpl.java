package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.EmptymainDao;
import com.ruanchuangsoft.platform.entity.EmptymainEntity;
import com.ruanchuangsoft.platform.service.EmptymainService;
import org.springframework.transaction.annotation.Transactional;


@Service("emptymainService")

public class EmptymainServiceImpl implements EmptymainService {
	@Autowired
	private EmptymainDao emptymainDao;
	
	@Override
	public EmptymainEntity queryObject(Long id){
		return emptymainDao.queryObject(id);
	}
	
	@Override
	public List<EmptymainEntity> queryList(Map<String, Object> map){
		return emptymainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return emptymainDao.queryTotal(map);
	}
	
	@Override
	public void save(EmptymainEntity emptymain){
		emptymainDao.save(emptymain);
	}
	
	@Override
	public void update(EmptymainEntity emptymain){
		emptymainDao.update(emptymain);
	}
	
	@Override
	public void delete(Long id){
		emptymainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		emptymainDao.deleteBatch(ids);
	}
	
}
