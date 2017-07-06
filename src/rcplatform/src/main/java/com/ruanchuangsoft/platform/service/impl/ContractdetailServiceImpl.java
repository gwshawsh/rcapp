package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ContractdetailDao;
import com.ruanchuangsoft.platform.entity.ContractdetailEntity;
import com.ruanchuangsoft.platform.service.ContractdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("contractdetailService")
public class ContractdetailServiceImpl implements ContractdetailService {
	@Autowired
	private ContractdetailDao contractdetailDao;
	
	@Override
	public ContractdetailEntity queryObject(Long id){
		return contractdetailDao.queryObject(id);
	}
	
	@Override
	public List<ContractdetailEntity> queryList(Map<String, Object> map){
		return contractdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return contractdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(ContractdetailEntity contractdetail){
		contractdetailDao.save(contractdetail);
	}
	
	@Override
	public void update(ContractdetailEntity contractdetail){
		contractdetailDao.update(contractdetail);
	}
	
	@Override
	public void delete(Long id){
		contractdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		contractdetailDao.deleteBatch(ids);
	}
	
}
