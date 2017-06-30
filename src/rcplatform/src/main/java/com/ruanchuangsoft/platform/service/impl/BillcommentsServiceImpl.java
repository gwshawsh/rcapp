package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BillcommentsDao;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.service.BillcommentsService;
import org.springframework.transaction.annotation.Transactional;


@Service("billcommentsService")
public class BillcommentsServiceImpl implements BillcommentsService {
	@Autowired
	private BillcommentsDao billcommentsDao;
	
	@Override
	public BillcommentsEntity queryObject(Long id){
		return billcommentsDao.queryObject(id);
	}
	
	@Override
	public List<BillcommentsEntity> queryList(Map<String, Object> map){
		return billcommentsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return billcommentsDao.queryTotal(map);
	}
	
	@Override
	public void save(BillcommentsEntity billcomments){
		billcommentsDao.save(billcomments);
	}
	
	@Override
	public void update(BillcommentsEntity billcomments){
		billcommentsDao.update(billcomments);
	}
	
	@Override
	public void delete(Long id){
		billcommentsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		billcommentsDao.deleteBatch(ids);
	}
	
}
