package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.EnumtableDao;
import com.ruanchuangsoft.platform.entity.EnumtableEntity;
import com.ruanchuangsoft.platform.service.EnumtableService;
import org.springframework.transaction.annotation.Transactional;


@Service("enumtableService")
public class EnumtableServiceImpl implements EnumtableService {
	@Autowired
	private EnumtableDao enumtableDao;
	
	@Override
	public EnumtableEntity queryObject(Long id){
		return enumtableDao.queryObject(id);
	}
	
	@Override
	public List<EnumtableEntity> queryList(Map<String, Object> map){
		return enumtableDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return enumtableDao.queryTotal(map);
	}
	
	@Override
	public void save(EnumtableEntity enumtable){
		enumtableDao.save(enumtable);
	}
	
	@Override
	public void update(EnumtableEntity enumtable){
		enumtableDao.update(enumtable);
	}
	
	@Override
	public void delete(Long id){
		enumtableDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		enumtableDao.deleteBatch(ids);
	}
	
}
