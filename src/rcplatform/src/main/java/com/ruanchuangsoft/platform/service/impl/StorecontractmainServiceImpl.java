package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.StorecontractmainDao;
import com.ruanchuangsoft.platform.dao.StorecontractdetailDao;
import com.ruanchuangsoft.platform.entity.StorecontractmainEntity;
import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;
import com.ruanchuangsoft.platform.service.StorecontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("storecontractmainService")
public class StorecontractmainServiceImpl implements StorecontractmainService {
	@Autowired
	private StorecontractmainDao storecontractmainDao;

    @Autowired
    private StorecontractdetailDao storecontractdetailDao;


    @Override
	public StorecontractmainEntity queryObject(Long id){
		return storecontractmainDao.queryObject(id);
	}
	
	@Override
	public List<StorecontractmainEntity> queryList(Map<String, Object> map){
		return storecontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return storecontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(StorecontractmainEntity storecontractmain){
        for(StorecontractdetailEntity item:storecontractmain.getDetails()){
				storecontractdetailDao.save(item);
        }
		storecontractmainDao.save(storecontractmain);
	}
	
	@Override
	public void update(StorecontractmainEntity storecontractmain){
		storecontractdetailDao.deleteByBillNo(storecontractmain.getBillno());

        for(StorecontractdetailEntity item:storecontractmain.getDetails()){
				storecontractdetailDao.save(item);
        }

		storecontractmainDao.update(storecontractmain);
	}
	
	@Override
	public void delete(Long id){
		 StorecontractmainEntity main = queryObject(id);
        if (main != null) {
				storecontractmainDao.delete(id);

				storecontractdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			storecontractmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			storecontractmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			storecontractmainDao.unauditBatch(ids);
    }
}
