package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.FeeinfoDao;
import com.ruanchuangsoft.platform.entity.FeeinfoEntity;
import com.ruanchuangsoft.platform.service.FeeinfoService;
import org.springframework.transaction.annotation.Transactional;


@Service("feeinfoService")
public class FeeinfoServiceImpl implements FeeinfoService {
	@Autowired
	private FeeinfoDao feeinfoDao;
	
	@Override
	public FeeinfoEntity queryObject(Long id){
		return feeinfoDao.queryObject(id);
	}
	
	@Override
	public List<FeeinfoEntity> queryList(Map<String, Object> map){
		return feeinfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return feeinfoDao.queryTotal(map);
	}
	
	@Override
	public void save(FeeinfoEntity feeinfo){
		feeinfoDao.save(feeinfo);
	}
	
	@Override
	public void update(FeeinfoEntity feeinfo){
		feeinfoDao.update(feeinfo);
	}
	
	@Override
	public void delete(Long id){
		feeinfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		feeinfoDao.deleteBatch(ids);
	}
	
}
