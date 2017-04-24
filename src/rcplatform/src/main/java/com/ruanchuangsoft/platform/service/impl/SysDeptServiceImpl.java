package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.SysDeptDao;
import com.ruanchuangsoft.platform.entity.SysDeptEntity;
import com.ruanchuangsoft.platform.service.SysDeptService;
import org.springframework.web.servlet.support.RequestContextUtils;


@Service("sysDeptService")
public class SysDeptServiceImpl implements SysDeptService {
	@Autowired
	private SysDeptDao sysDeptDao;
	
	@Override
	public SysDeptEntity queryObject(Long deptId){
		return sysDeptDao.queryObject(deptId);
	}
	
	@Override
	public List<SysDeptEntity> queryList(Map<String, Object> map){

		return sysDeptDao.queryList(map);

	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysDeptDao.queryTotal(map);
	}
	
	@Override
	public void save(SysDeptEntity sysDept){
		sysDeptDao.save(sysDept);
	}
	
	@Override
	public void update(SysDeptEntity sysDept){
		sysDeptDao.update(sysDept);
	}
	
	@Override
	public void delete(Long deptId){
		sysDeptDao.delete(deptId);
	}
	
	@Override
	public void deleteBatch(Long[] deptIds){
		sysDeptDao.deleteBatch(deptIds);
	}
	
}
