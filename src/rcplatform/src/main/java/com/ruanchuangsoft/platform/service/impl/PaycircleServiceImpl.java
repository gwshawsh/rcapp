package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PaycircleDao;
import com.ruanchuangsoft.platform.entity.PaycircleEntity;
import com.ruanchuangsoft.platform.service.PaycircleService;
import org.springframework.transaction.annotation.Transactional;


@Service("paycircleService")
public class PaycircleServiceImpl implements PaycircleService {
	@Autowired
	private PaycircleDao paycircleDao;
	
	@Override
	public PaycircleEntity queryObject(Long id){
		return paycircleDao.queryObject(id);
	}
	
	@Override
	public List<PaycircleEntity> queryList(Map<String, Object> map){
		return paycircleDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return paycircleDao.queryTotal(map);
	}
	
	@Override
	public void save(PaycircleEntity paycircle){
		paycircleDao.save(paycircle);
	}
	
	@Override
	public void update(PaycircleEntity paycircle){
		paycircleDao.update(paycircle);
	}
	
	@Override
	public void delete(Long id){
		paycircleDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		paycircleDao.deleteBatch(ids);
	}
	
}
