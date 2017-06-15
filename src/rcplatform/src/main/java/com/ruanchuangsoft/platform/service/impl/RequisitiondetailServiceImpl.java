package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RequisitiondetailDao;
import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import com.ruanchuangsoft.platform.service.RequisitiondetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("requisitiondetailService")
public class RequisitiondetailServiceImpl implements RequisitiondetailService {
	@Autowired
	private RequisitiondetailDao requisitiondetailDao;
	
	@Override
	public RequisitiondetailEntity queryObject(Long id){
		return requisitiondetailDao.queryObject(id);
	}
	
	@Override
	public List<RequisitiondetailEntity> queryList(Map<String, Object> map){
		return requisitiondetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return requisitiondetailDao.queryTotal(map);
	}
	
	@Override
	public void save(RequisitiondetailEntity requisitiondetail){
		requisitiondetailDao.save(requisitiondetail);
	}
	
	@Override
	public void update(RequisitiondetailEntity requisitiondetail){
		requisitiondetailDao.update(requisitiondetail);
	}
	
	@Override
	public void delete(Long id){
		requisitiondetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		requisitiondetailDao.deleteBatch(ids);
	}
	
}
