package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PreemptymainDao;
import com.ruanchuangsoft.platform.entity.PreemptymainEntity;
import com.ruanchuangsoft.platform.service.PreemptymainService;
import org.springframework.transaction.annotation.Transactional;


@Service("preemptymainService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PreemptymainServiceImpl implements PreemptymainService {
	@Autowired
	private PreemptymainDao preemptymainDao;
	
	@Override
	public PreemptymainEntity queryObject(Long id){
		return preemptymainDao.queryObject(id);
	}
	
	@Override
	public List<PreemptymainEntity> queryList(Map<String, Object> map){
		return preemptymainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return preemptymainDao.queryTotal(map);
	}
	
	@Override
	public void save(PreemptymainEntity preemptymain){
		preemptymainDao.save(preemptymain);
	}
	
	@Override
	public void update(PreemptymainEntity preemptymain){
		preemptymainDao.update(preemptymain);
	}
	
	@Override
	public void delete(Long id){
		preemptymainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		preemptymainDao.deleteBatch(ids);
	}
	
}
