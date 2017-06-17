package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PaytypeDao;
import com.ruanchuangsoft.platform.entity.PaytypeEntity;
import com.ruanchuangsoft.platform.service.PaytypeService;
import org.springframework.transaction.annotation.Transactional;


@Service("paytypeService")
public class PaytypeServiceImpl implements PaytypeService {
	@Autowired
	private PaytypeDao paytypeDao;
	
	@Override
	public PaytypeEntity queryObject(Long id){
		return paytypeDao.queryObject(id);
	}
	
	@Override
	public List<PaytypeEntity> queryList(Map<String, Object> map){
		return paytypeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return paytypeDao.queryTotal(map);
	}
	
	@Override
	public void save(PaytypeEntity paytype){
		paytypeDao.save(paytype);
	}
	
	@Override
	public void update(PaytypeEntity paytype){
		paytypeDao.update(paytype);
	}
	
	@Override
	public void delete(Long id){
		paytypeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		paytypeDao.deleteBatch(ids);
	}
	
}
