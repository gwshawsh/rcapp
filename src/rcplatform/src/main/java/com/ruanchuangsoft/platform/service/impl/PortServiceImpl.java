package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PortDao;
import com.ruanchuangsoft.platform.entity.PortEntity;
import com.ruanchuangsoft.platform.service.PortService;
import org.springframework.transaction.annotation.Transactional;


@Service("portService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PortServiceImpl implements PortService {
	@Autowired
	private PortDao portDao;
	
	@Override
	public PortEntity queryObject(Long id){
		return portDao.queryObject(id);
	}
	
	@Override
	public List<PortEntity> queryList(Map<String, Object> map){
		return portDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return portDao.queryTotal(map);
	}
	
	@Override
	public void save(PortEntity port){
		portDao.save(port);
	}
	
	@Override
	public void update(PortEntity port){
		portDao.update(port);
	}
	
	@Override
	public void delete(Long id){
		portDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		portDao.deleteBatch(ids);
	}
	
}
