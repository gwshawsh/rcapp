package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BuycontractmainDao;
import com.ruanchuangsoft.platform.dao.BuycontractdetailDao;
import com.ruanchuangsoft.platform.entity.BuycontractmainEntity;
import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;
import com.ruanchuangsoft.platform.service.BuycontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("buycontractmainService")
public class BuycontractmainServiceImpl implements BuycontractmainService {
	@Autowired
	private BuycontractmainDao buycontractmainDao;

    @Autowired
    private BuycontractdetailDao buycontractdetailDao;


    @Override
	public BuycontractmainEntity queryObject(Long id){
		return buycontractmainDao.queryObject(id);
	}
	
	@Override
	public List<BuycontractmainEntity> queryList(Map<String, Object> map){
		return buycontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return buycontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(BuycontractmainEntity buycontractmain){
        for(BuycontractdetailEntity item:buycontractmain.getDetails()){
				buycontractdetailDao.save(item);
        }
		buycontractmainDao.save(buycontractmain);
	}
	
	@Override
	public void update(BuycontractmainEntity buycontractmain){
		buycontractdetailDao.deleteByBillNo(buycontractmain.getBillno());

        for(BuycontractdetailEntity item:buycontractmain.getDetails()){
				buycontractdetailDao.save(item);
        }

		buycontractmainDao.update(buycontractmain);
	}
	
	@Override
	public void delete(Long id){
		 BuycontractmainEntity main = queryObject(id);
        if (main != null) {
				buycontractmainDao.delete(id);

				buycontractdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			buycontractmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			buycontractmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			buycontractmainDao.unauditBatch(ids);
    }
}
