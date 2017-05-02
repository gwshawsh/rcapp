package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BoxsDao;
import com.ruanchuangsoft.platform.entity.BoxsEntity;
import com.ruanchuangsoft.platform.service.BoxsService;



@Service("boxsService")
public class BoxsServiceImpl implements BoxsService {
	@Autowired
	private BoxsDao boxsDao;
	
	@Override
	public BoxsEntity queryObject(Long id){
		return boxsDao.queryObject(id);
	}
	
	@Override
	public List<BoxsEntity> queryList(Map<String, Object> map){
		return boxsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return boxsDao.queryTotal(map);
	}
	
	@Override
	public void save(BoxsEntity boxs){
		boxsDao.save(boxs);
	}
	
	@Override
	public void update(BoxsEntity boxs){
		boxsDao.update(boxs);
	}
	
	@Override
	public void delete(Long id){
		boxsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		boxsDao.deleteBatch(ids);
	}
	
}
