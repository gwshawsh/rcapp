package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.CostcategoryDao;
import com.ruanchuangsoft.platform.entity.CostcategoryEntity;
import com.ruanchuangsoft.platform.service.CostcategoryService;
import org.springframework.transaction.annotation.Transactional;


@Service("costcategoryService")
public class CostcategoryServiceImpl implements CostcategoryService {
	@Autowired
	private CostcategoryDao costcategoryDao;
	
	@Override
	public CostcategoryEntity queryObject(Long id){
		return costcategoryDao.queryObject(id);
	}
	
	@Override
	public List<CostcategoryEntity> queryList(Map<String, Object> map){
		return costcategoryDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return costcategoryDao.queryTotal(map);
	}
	
	@Override
	public void save(CostcategoryEntity costcategory){
		costcategoryDao.save(costcategory);
	}
	
	@Override
	public void update(CostcategoryEntity costcategory){
		costcategoryDao.update(costcategory);
	}
	
	@Override
	public void delete(Long id){
		costcategoryDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		costcategoryDao.deleteBatch(ids);
	}
	
}
