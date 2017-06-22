package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PlaceDao;
import com.ruanchuangsoft.platform.entity.PlaceEntity;
import com.ruanchuangsoft.platform.service.PlaceService;
import org.springframework.transaction.annotation.Transactional;


@Service("placeService")
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	private PlaceDao placeDao;
	
	@Override
	public PlaceEntity queryObject(Long id){
		return placeDao.queryObject(id);
	}
	
	@Override
	public List<PlaceEntity> queryList(Map<String, Object> map){
		return placeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return placeDao.queryTotal(map);
	}
	
	@Override
	public void save(PlaceEntity place){
		placeDao.save(place);
	}
	
	@Override
	public void update(PlaceEntity place){
		placeDao.update(place);
	}
	
	@Override
	public void delete(Long id){
		placeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		placeDao.deleteBatch(ids);
	}
	
}
