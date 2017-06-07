package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TranslineDao;
import com.ruanchuangsoft.platform.entity.TranslineEntity;
import com.ruanchuangsoft.platform.service.TranslineService;
import org.springframework.transaction.annotation.Transactional;


@Service("translineService")
public class TranslineServiceImpl implements TranslineService {
	@Autowired
	private TranslineDao translineDao;
	
	@Override
	public TranslineEntity queryObject(Long id){
		return translineDao.queryObject(id);
	}
	
	@Override
	public List<TranslineEntity> queryList(Map<String, Object> map){
		return translineDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return translineDao.queryTotal(map);
	}
	
	@Override
	public void save(TranslineEntity transline){
		translineDao.save(transline);
	}
	
	@Override
	public void update(TranslineEntity transline){
		translineDao.update(transline);
	}
	
	@Override
	public void delete(Long id){
		translineDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		translineDao.deleteBatch(ids);
	}
	
}
