package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TransboxmainDao;
import com.ruanchuangsoft.platform.dao.TransboxdetailDao;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("transboxmainService")
public class TransboxmainServiceImpl implements TransboxmainService {
	@Autowired
	private TransboxmainDao transboxmainDao;

    @Autowired
    private TransboxdetailDao transboxdetailDao;


    @Override
	public TransboxmainEntity queryObject(Long id){
		return transboxmainDao.queryObject(id);
	}
	
	@Override
	public List<TransboxmainEntity> queryList(Map<String, Object> map){
		return transboxmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transboxmainDao.queryTotal(map);
	}
	
	@Override
	public void save(TransboxmainEntity transboxmain){
        for(TransboxdetailEntity item:transboxmain.getDetails()){
				transboxdetailDao.save(item);
        }
		transboxmainDao.save(transboxmain);
	}
	
	@Override
	public void update(TransboxmainEntity transboxmain){
        for(TransboxdetailEntity item:transboxmain.getDetails()){
				transboxdetailDao.save(item);
        }
			transboxmainDao.update(transboxmain);
	}
	
	@Override
	public void delete(Long id){
		 TransboxmainEntity main = queryObject(id);
        if (main != null) {
				transboxmainDao.delete(id);

				transboxdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			transboxmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			transboxmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			transboxmainDao.unauditBatch(ids);
    }
}
