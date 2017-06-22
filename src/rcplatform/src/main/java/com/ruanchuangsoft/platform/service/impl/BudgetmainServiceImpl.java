package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BudgetmainDao;
import com.ruanchuangsoft.platform.dao.BudgetdetailDao;
import com.ruanchuangsoft.platform.entity.BudgetmainEntity;
import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;
import com.ruanchuangsoft.platform.service.BudgetmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("budgetmainService")
public class BudgetmainServiceImpl implements BudgetmainService {
	@Autowired
	private BudgetmainDao budgetmainDao;

    @Autowired
    private BudgetdetailDao budgetdetailDao;


    @Override
	public BudgetmainEntity queryObject(Long id){
		return budgetmainDao.queryObject(id);
	}
	
	@Override
	public List<BudgetmainEntity> queryList(Map<String, Object> map){
		return budgetmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return budgetmainDao.queryTotal(map);
	}
	
	@Override
	public void save(BudgetmainEntity budgetmain){
        for(BudgetdetailEntity item:budgetmain.getDetails()){
				budgetdetailDao.save(item);
        }
		budgetmainDao.save(budgetmain);
	}
	
	@Override
	public void update(BudgetmainEntity budgetmain){
		budgetdetailDao.deleteByBillNo(budgetmain.getBillno());

        for(BudgetdetailEntity item:budgetmain.getDetails()){
				budgetdetailDao.save(item);
        }

		budgetmainDao.update(budgetmain);
	}
	
	@Override
	public void delete(Long id){
		 BudgetmainEntity main = queryObject(id);
        if (main != null) {
				budgetmainDao.delete(id);

				budgetdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			budgetmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids){
			budgetmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			budgetmainDao.unauditBatch(ids);
    }
}
