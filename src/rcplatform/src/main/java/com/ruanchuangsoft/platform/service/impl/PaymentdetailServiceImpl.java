package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.PaymentdetailDao;
import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import com.ruanchuangsoft.platform.service.PaymentdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("paymentdetailService")
public class PaymentdetailServiceImpl implements PaymentdetailService {
	@Autowired
	private PaymentdetailDao paymentdetailDao;
	
	@Override
	public PaymentdetailEntity queryObject(Long id){
		return paymentdetailDao.queryObject(id);
	}
	
	@Override
	public List<PaymentdetailEntity> queryList(Map<String, Object> map){
		return paymentdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return paymentdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(PaymentdetailEntity paymentdetail){
		paymentdetailDao.save(paymentdetail);
	}
	
	@Override
	public void update(PaymentdetailEntity paymentdetail){
		paymentdetailDao.update(paymentdetail);
	}
	
	@Override
	public void delete(Long id){
		paymentdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		paymentdetailDao.deleteBatch(ids);
	}
	
}
