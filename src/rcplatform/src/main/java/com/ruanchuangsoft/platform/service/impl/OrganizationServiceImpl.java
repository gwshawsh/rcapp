package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.OrganizationDao;
import com.ruanchuangsoft.platform.entity.OrganizationEntity;
import com.ruanchuangsoft.platform.service.OrganizationService;



@Service("organizationService")
public class OrganizationServiceImpl implements OrganizationService {
	@Autowired
	private OrganizationDao organizationDao;
	
	@Override
	public OrganizationEntity queryObject(Long id){
		return organizationDao.queryObject(id);
	}
	
	@Override
	public List<OrganizationEntity> queryList(Map<String, Object> map){
		return organizationDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return organizationDao.queryTotal(map);
	}
	
	@Override
	public void save(OrganizationEntity organization){
		organizationDao.save(organization);
	}
	
	@Override
	public void update(OrganizationEntity organization){
		organizationDao.update(organization);
	}
	
	@Override
	public void delete(Long id){
		organizationDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		organizationDao.deleteBatch(ids);
	}
	
}
