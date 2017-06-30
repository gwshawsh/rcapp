package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.OrdermainDao;
import com.ruanchuangsoft.platform.dao.OrderdetailDao;
import com.ruanchuangsoft.platform.entity.OrdermainEntity;
import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import com.ruanchuangsoft.platform.service.OrdermainService;
import org.springframework.transaction.annotation.Transactional;


@Service("ordermainService")
public class OrdermainServiceImpl implements OrdermainService {
	@Autowired
	private OrdermainDao ordermainDao;

    @Autowired
    private OrderdetailDao orderdetailDao;


    @Override
	public OrdermainEntity queryObject(Long id){
		return ordermainDao.queryObject(id);
	}
	
	@Override
	public List<OrdermainEntity> queryList(Map<String, Object> map){
		return ordermainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return ordermainDao.queryTotal(map);
	}
	
	@Override
	public void save(OrdermainEntity ordermain){
        for(OrderdetailEntity item:ordermain.getDetails()){
				orderdetailDao.save(item);
        }
		ordermainDao.save(ordermain);
	}
	
	@Override
	public void update(OrdermainEntity ordermain){
		orderdetailDao.deleteByBillNo(ordermain.getBillno());

		if(ordermain.getDetails()!=null&&ordermain.getDetails().size()>0) {
			for (OrderdetailEntity item : ordermain.getDetails()) {
				orderdetailDao.save(item);
			}
		}

		ordermainDao.update(ordermain);
	}
	
	@Override
	public void delete(Long id){
		 OrdermainEntity main = queryObject(id);
        if (main != null) {
				ordermainDao.delete(id);

				orderdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			ordermainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			ordermainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			ordermainDao.unauditBatch(ids);
    }
}
