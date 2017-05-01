package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PlanKongxiangMainDao;
import com.ruanchuangsoft.platform.entity.PlanKongxiangMainEntity;
import com.ruanchuangsoft.platform.service.PlanKongxiangMainService;



@Service("planKongxiangMainService")
public class PlanKongxiangMainServiceImpl implements PlanKongxiangMainService {
	@Autowired
	private PlanKongxiangMainDao planKongxiangMainDao;
	
	@Override
	public PlanKongxiangMainEntity queryObject(Long id){
		return planKongxiangMainDao.queryObject(id);
	}
	
	@Override
	public List<PlanKongxiangMainEntity> queryList(Map<String, Object> map){
		return planKongxiangMainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return planKongxiangMainDao.queryTotal(map);
	}
	
	@Override
	public void save(PlanKongxiangMainEntity planKongxiangMain){
		planKongxiangMainDao.save(planKongxiangMain);
	}
	
	@Override
	public void update(PlanKongxiangMainEntity planKongxiangMain){
		planKongxiangMainDao.update(planKongxiangMain);
	}
	
	@Override
	public void delete(Long id){
		planKongxiangMainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		planKongxiangMainDao.deleteBatch(ids);
	}
	
}
