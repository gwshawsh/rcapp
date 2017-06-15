package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PaymentmainDao;
import com.ruanchuangsoft.platform.dao.PaymentdetailDao;
import com.ruanchuangsoft.platform.entity.PaymentmainEntity;
import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import com.ruanchuangsoft.platform.service.PaymentmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("paymentmainService")
public class PaymentmainServiceImpl implements PaymentmainService {
	@Autowired
	private PaymentmainDao paymentmainDao;

    @Autowired
    private PaymentdetailDao paymentdetailDao;


    @Override
	public PaymentmainEntity queryObject(Long id){
		return paymentmainDao.queryObject(id);
	}
	
	@Override
	public List<PaymentmainEntity> queryList(Map<String, Object> map){
		return paymentmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return paymentmainDao.queryTotal(map);
	}
	
	@Override
	public void save(PaymentmainEntity paymentmain){
        for(PaymentdetailEntity item:paymentmain.getDetails()){
				paymentdetailDao.save(item);
        }
		paymentmainDao.save(paymentmain);
	}
	
	@Override
	public void update(PaymentmainEntity paymentmain){
        for(PaymentdetailEntity item:paymentmain.getDetails()){
				paymentdetailDao.save(item);
        }
			paymentmainDao.update(paymentmain);
	}
	
	@Override
	public void delete(Long id){
		 PaymentmainEntity main = queryObject(id);
        if (main != null) {
				paymentmainDao.delete(id);

				paymentdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
	public void deleteBatch(Long[] ids){
		paymentmainDao.deleteBatch(ids);
	}
	
}
