package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TakeboxdetailDao;
import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.service.TakeboxdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("takeboxdetailService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TakeboxdetailServiceImpl implements TakeboxdetailService {
	@Autowired
	private TakeboxdetailDao takeboxdetailDao;
	
	@Override
	public TakeboxdetailEntity queryObject(Long id){
		return takeboxdetailDao.queryObject(id);
	}
	
	@Override
	public List<TakeboxdetailEntity> queryList(Map<String, Object> map){
		return takeboxdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return takeboxdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(TakeboxdetailEntity takeboxdetail){
		takeboxdetailDao.save(takeboxdetail);
	}
	
	@Override
	public void update(TakeboxdetailEntity takeboxdetail){
		takeboxdetailDao.update(takeboxdetail);
	}
	
	@Override
	public void delete(Long id){
		takeboxdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		takeboxdetailDao.deleteBatch(ids);
	}
	
}
