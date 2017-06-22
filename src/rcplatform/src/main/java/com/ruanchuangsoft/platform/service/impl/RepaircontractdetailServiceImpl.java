package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RepaircontractdetailDao;
import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;
import com.ruanchuangsoft.platform.service.RepaircontractdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("repaircontractdetailService")
public class RepaircontractdetailServiceImpl implements RepaircontractdetailService {
	@Autowired
	private RepaircontractdetailDao repaircontractdetailDao;
	
	@Override
	public RepaircontractdetailEntity queryObject(Long id){
		return repaircontractdetailDao.queryObject(id);
	}
	
	@Override
	public List<RepaircontractdetailEntity> queryList(Map<String, Object> map){
		return repaircontractdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return repaircontractdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(RepaircontractdetailEntity repaircontractdetail){
		repaircontractdetailDao.save(repaircontractdetail);
	}
	
	@Override
	public void update(RepaircontractdetailEntity repaircontractdetail){
		repaircontractdetailDao.update(repaircontractdetail);
	}
	
	@Override
	public void delete(Long id){
		repaircontractdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		repaircontractdetailDao.deleteBatch(ids);
	}
	
}
