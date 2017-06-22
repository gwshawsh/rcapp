package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TranscontractmainDao;
import com.ruanchuangsoft.platform.dao.TranscontractdetailDao;
import com.ruanchuangsoft.platform.entity.TranscontractmainEntity;
import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
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
        for(TranscontractdetailEntity item:transcontractmain.getDetails()){
				transcontractdetailDao.save(item);
        }
		transcontractmainDao.save(transcontractmain);
	}
	
	@Override
	public void update(TranscontractmainEntity transcontractmain){
		transcontractdetailDao.deleteByBillNo(transcontractmain.getBillno());

        for(TranscontractdetailEntity item:transcontractmain.getDetails()){
				transcontractdetailDao.save(item);
        }

		transcontractmainDao.update(transcontractmain);
	}
	
	@Override
	public void delete(Long id){
		 TranscontractmainEntity main = queryObject(id);
        if (main != null) {
				transcontractmainDao.delete(id);

				transcontractdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			transcontractmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			transcontractmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			transcontractmainDao.unauditBatch(ids);
    }
}
