package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TranscontractdetailDao;
import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import com.ruanchuangsoft.platform.service.TranscontractdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("transcontractdetailService")
public class TranscontractdetailServiceImpl implements TranscontractdetailService {
	@Autowired
	private TranscontractdetailDao transcontractdetailDao;
	
	@Override
	public TranscontractdetailEntity queryObject(Long id){
		return transcontractdetailDao.queryObject(id);
	}
	
	@Override
	public List<TranscontractdetailEntity> queryList(Map<String, Object> map){
		return transcontractdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transcontractdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(TranscontractdetailEntity transcontractdetail){
		transcontractdetailDao.save(transcontractdetail);
	}
	
	@Override
	public void update(TranscontractdetailEntity transcontractdetail){
		transcontractdetailDao.update(transcontractdetail);
	}
	
	@Override
	public void delete(Long id){
		transcontractdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transcontractdetailDao.deleteBatch(ids);
	}
	
}
