package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BaseOpBankDao;
import com.ruanchuangsoft.platform.entity.BaseOpBankEntity;
import com.ruanchuangsoft.platform.service.BaseOpBankService;
import org.springframework.transaction.annotation.Transactional;


@Service("baseOpBankService")
public class BaseOpBankServiceImpl implements BaseOpBankService {
	@Autowired
	private BaseOpBankDao baseOpBankDao;
	
	@Override
	public BaseOpBankEntity queryObject(Integer bobTid){
		return baseOpBankDao.queryObject(bobTid);
	}
	
	@Override
	public List<BaseOpBankEntity> queryList(Map<String, Object> map){
		return baseOpBankDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return baseOpBankDao.queryTotal(map);
	}
	
	@Override
	public void save(BaseOpBankEntity baseOpBank){
		baseOpBankDao.save(baseOpBank);
	}
	
	@Override
	public void update(BaseOpBankEntity baseOpBank){
		baseOpBankDao.update(baseOpBank);
	}
	
	@Override
	public void delete(Integer bobTid){
		baseOpBankDao.delete(bobTid);
	}
	
	@Override
	public void deleteBatch(Integer[] bobTids){
		baseOpBankDao.deleteBatch(bobTids);
	}
	
}
