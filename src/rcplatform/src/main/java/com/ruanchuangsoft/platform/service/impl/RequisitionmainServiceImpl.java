package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RequisitionmainDao;
import com.ruanchuangsoft.platform.dao.RequisitiondetailDao;
import com.ruanchuangsoft.platform.entity.RequisitionmainEntity;
import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import com.ruanchuangsoft.platform.service.RequisitionmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("requisitionmainService")
public class RequisitionmainServiceImpl implements RequisitionmainService {
	@Autowired
	private RequisitionmainDao requisitionmainDao;

    @Autowired
    private RequisitiondetailDao requisitiondetailDao;


    @Override
	public RequisitionmainEntity queryObject(Long id){
		return requisitionmainDao.queryObject(id);
	}
	
	@Override
	public List<RequisitionmainEntity> queryList(Map<String, Object> map){
		return requisitionmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return requisitionmainDao.queryTotal(map);
	}
	
	@Override
	public void save(RequisitionmainEntity requisitionmain){
        for(RequisitiondetailEntity item:requisitionmain.getDetails()){
				requisitiondetailDao.save(item);
        }
		requisitionmainDao.save(requisitionmain);
	}
	
	@Override
	public void update(RequisitionmainEntity requisitionmain){
        for(RequisitiondetailEntity item:requisitionmain.getDetails()){
				requisitiondetailDao.save(item);
        }
			requisitionmainDao.update(requisitionmain);
	}
	
	@Override
	public void delete(Long id){
		 RequisitionmainEntity main = queryObject(id);
        if (main != null) {
				requisitionmainDao.delete(id);

				requisitiondetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
	public void deleteBatch(Long[] ids){
		requisitionmainDao.deleteBatch(ids);
	}
	
}
