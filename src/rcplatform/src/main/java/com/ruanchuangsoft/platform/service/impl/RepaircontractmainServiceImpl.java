package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RepaircontractmainDao;
import com.ruanchuangsoft.platform.dao.RepaircontractdetailDao;
import com.ruanchuangsoft.platform.entity.RepaircontractmainEntity;
import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;
import com.ruanchuangsoft.platform.service.RepaircontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("repaircontractmainService")
public class RepaircontractmainServiceImpl implements RepaircontractmainService {
	@Autowired
	private RepaircontractmainDao repaircontractmainDao;

    @Autowired
    private RepaircontractdetailDao repaircontractdetailDao;


    @Override
	public RepaircontractmainEntity queryObject(Long id){
		return repaircontractmainDao.queryObject(id);
	}
	
	@Override
	public List<RepaircontractmainEntity> queryList(Map<String, Object> map){
		return repaircontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return repaircontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(RepaircontractmainEntity repaircontractmain){
        for(RepaircontractdetailEntity item:repaircontractmain.getDetails()){
				repaircontractdetailDao.save(item);
        }
		repaircontractmainDao.save(repaircontractmain);
	}
	
	@Override
	public void update(RepaircontractmainEntity repaircontractmain){
		repaircontractdetailDao.deleteByBillNo(repaircontractmain.getBillno());

        for(RepaircontractdetailEntity item:repaircontractmain.getDetails()){
				repaircontractdetailDao.save(item);
        }

		repaircontractmainDao.update(repaircontractmain);
	}
	
	@Override
	public void delete(Long id){
		 RepaircontractmainEntity main = queryObject(id);
        if (main != null) {
				repaircontractmainDao.delete(id);

				repaircontractdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			repaircontractmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			repaircontractmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			repaircontractmainDao.unauditBatch(ids);
    }
}
