package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.GclassDao;
import com.ruanchuangsoft.platform.entity.GclassEntity;
import com.ruanchuangsoft.platform.service.GclassService;
import org.springframework.transaction.annotation.Transactional;


@Service("gclassService")
public class GclassServiceImpl implements GclassService {
	@Autowired
	private GclassDao gclassDao;
	
	@Override
	public GclassEntity queryObject(Long id){
		return gclassDao.queryObject(id);
	}
	
	@Override
	public List<GclassEntity> queryList(Map<String, Object> map){
		return gclassDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return gclassDao.queryTotal(map);
	}
	
	@Override
	public void save(GclassEntity gclass){
		gclassDao.save(gclass);
	}
	
	@Override
	public void update(GclassEntity gclass){
		gclassDao.update(gclass);
	}
	
	@Override
	public void delete(Long id){
		gclassDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		gclassDao.deleteBatch(ids);
	}
	
}
