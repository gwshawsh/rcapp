package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.HeavymainDao;
import com.ruanchuangsoft.platform.entity.HeavymainEntity;
import com.ruanchuangsoft.platform.service.HeavymainService;
import org.springframework.transaction.annotation.Transactional;


@Service("heavymainService")
public class HeavymainServiceImpl implements HeavymainService {
	@Autowired
	private HeavymainDao heavymainDao;
	
	@Override
	public HeavymainEntity queryObject(Long id){
		return heavymainDao.queryObject(id);
	}
	
	@Override
	public List<HeavymainEntity> queryList(Map<String, Object> map){
		return heavymainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return heavymainDao.queryTotal(map);
	}
	
	@Override
	public void save(HeavymainEntity heavymain){
		heavymainDao.save(heavymain);
	}
	
	@Override
	public void update(HeavymainEntity heavymain){
		heavymainDao.update(heavymain);
	}
	
	@Override
	public void delete(Long id){
		heavymainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		heavymainDao.deleteBatch(ids);
	}
	
}
