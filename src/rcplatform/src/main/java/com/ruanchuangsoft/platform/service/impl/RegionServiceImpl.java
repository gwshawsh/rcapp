package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RegionDao;
import com.ruanchuangsoft.platform.entity.RegionEntity;
import com.ruanchuangsoft.platform.service.RegionService;
import org.springframework.transaction.annotation.Transactional;


@Service("regionService")
public class RegionServiceImpl implements RegionService {
	@Autowired
	private RegionDao regionDao;
	
	@Override
	public RegionEntity queryObject(Long id){
		return regionDao.queryObject(id);
	}
	
	@Override
	public List<RegionEntity> queryList(Map<String, Object> map){
		return regionDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return regionDao.queryTotal(map);
	}
	
	@Override
	public void save(RegionEntity region){
		regionDao.save(region);
	}
	
	@Override
	public void update(RegionEntity region){
		regionDao.update(region);
	}
	
	@Override
	public void delete(Long id){
		regionDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		regionDao.deleteBatch(ids);
	}
	
}
