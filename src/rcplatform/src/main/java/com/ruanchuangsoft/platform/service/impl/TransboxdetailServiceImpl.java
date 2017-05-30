package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TransboxdetailDao;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.service.TransboxdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("transboxdetailService")
public class TransboxdetailServiceImpl implements TransboxdetailService {
	@Autowired
	private TransboxdetailDao transboxdetailDao;
	
	@Override
	public TransboxdetailEntity queryObject(Long id){
		return transboxdetailDao.queryObject(id);
	}
	
	@Override
	public List<TransboxdetailEntity> queryList(Map<String, Object> map){
		return transboxdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transboxdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(TransboxdetailEntity transboxdetail){
		transboxdetailDao.save(transboxdetail);
	}
	
	@Override
	public void update(TransboxdetailEntity transboxdetail){
		transboxdetailDao.update(transboxdetail);
	}
	
	@Override
	public void delete(Long id){
		transboxdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transboxdetailDao.deleteBatch(ids);
	}
	
}
