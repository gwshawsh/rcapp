package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.TransboxdetailDao;
import com.ruanchuangsoft.platform.dao.TranscontractdetailDao;
import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TranscontractmainDao;
import com.ruanchuangsoft.platform.entity.TranscontractmainEntity;
import com.ruanchuangsoft.platform.service.TranscontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("transcontractmainService")
public class TranscontractmainServiceImpl implements TranscontractmainService {
	@Autowired
	private TranscontractmainDao transcontractmainDao;

	@Autowired
	private TranscontractdetailDao transcontractdetailDao;
	
	@Override
	public TranscontractmainEntity queryObject(Long id){
		return transcontractmainDao.queryObject(id);
	}
	
	@Override
	public List<TranscontractmainEntity> queryList(Map<String, Object> map){
		return transcontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transcontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(TranscontractmainEntity transcontractmain){
		transcontractmainDao.save(transcontractmain);

		if(transcontractmain.getDetails()!=null&&transcontractmain.getDetails().size()>0){
			for(TranscontractdetailEntity item:transcontractmain.getDetails()){
				transcontractdetailDao.save(item);

			}
		}
	}
	
	@Override
	public void update(TranscontractmainEntity transcontractmain){
		transcontractmainDao.update(transcontractmain);
	}
	
	@Override
	public void delete(Long id){
		transcontractmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transcontractmainDao.deleteBatch(ids);
	}
	
}
