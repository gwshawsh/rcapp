package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BuycontractdetailDao;
import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;
import com.ruanchuangsoft.platform.service.BuycontractdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("buycontractdetailService")
public class BuycontractdetailServiceImpl implements BuycontractdetailService {
	@Autowired
	private BuycontractdetailDao buycontractdetailDao;
	
	@Override
	public BuycontractdetailEntity queryObject(Long id){
		return buycontractdetailDao.queryObject(id);
	}
	
	@Override
	public List<BuycontractdetailEntity> queryList(Map<String, Object> map){
		return buycontractdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return buycontractdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(BuycontractdetailEntity buycontractdetail){
		buycontractdetailDao.save(buycontractdetail);
	}
	
	@Override
	public void update(BuycontractdetailEntity buycontractdetail){
		buycontractdetailDao.update(buycontractdetail);
	}
	
	@Override
	public void delete(Long id){
		buycontractdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		buycontractdetailDao.deleteBatch(ids);
	}
	
}
