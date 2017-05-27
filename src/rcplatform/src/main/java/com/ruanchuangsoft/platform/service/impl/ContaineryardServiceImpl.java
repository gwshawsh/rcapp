package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ContaineryardDao;
import com.ruanchuangsoft.platform.entity.ContaineryardEntity;
import com.ruanchuangsoft.platform.service.ContaineryardService;
import org.springframework.transaction.annotation.Transactional;


@Service("containeryardService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ContaineryardServiceImpl implements ContaineryardService {
	@Autowired
	private ContaineryardDao containeryardDao;
	
	@Override
	public ContaineryardEntity queryObject(Long id){
		return containeryardDao.queryObject(id);
	}
	
	@Override
	public List<ContaineryardEntity> queryList(Map<String, Object> map){
		return containeryardDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return containeryardDao.queryTotal(map);
	}
	
	@Override
	public void save(ContaineryardEntity containeryard){
		containeryardDao.save(containeryard);
	}
	
	@Override
	public void update(ContaineryardEntity containeryard){
		containeryardDao.update(containeryard);
	}
	
	@Override
	public void delete(Long id){
		containeryardDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		containeryardDao.deleteBatch(ids);
	}
	
}
