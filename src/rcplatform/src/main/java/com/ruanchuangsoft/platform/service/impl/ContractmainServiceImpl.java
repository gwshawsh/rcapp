package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ContractmainDao;
import com.ruanchuangsoft.platform.dao.ContractdetailDao;
import com.ruanchuangsoft.platform.entity.ContractmainEntity;
import com.ruanchuangsoft.platform.entity.ContractdetailEntity;
import com.ruanchuangsoft.platform.service.ContractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("contractmainService")
public class ContractmainServiceImpl implements ContractmainService {
	@Autowired
	private ContractmainDao contractmainDao;

    @Autowired
    private ContractdetailDao contractdetailDao;


    @Override
	public ContractmainEntity queryObject(Long id){
		return contractmainDao.queryObject(id);
	}
	
	@Override
	public List<ContractmainEntity> queryList(Map<String, Object> map){
		return contractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return contractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(ContractmainEntity contractmain){
        for(ContractdetailEntity item:contractmain.getDetails()){
				contractdetailDao.save(item);
        }
		contractmainDao.save(contractmain);
	}
	
	@Override
	public void update(ContractmainEntity contractmain){
		contractdetailDao.deleteByBillNo(contractmain.getBillno());

		if(contractmain.getDetails()!=null&&contractmain.getDetails().size()>0){
            for (ContractdetailEntity item :contractmain.getDetails()){
					contractdetailDao.save(item);
            }
        }

		contractmainDao.update(contractmain);
	}
	
	@Override
	public void delete(Long id){
		 ContractmainEntity main = queryObject(id);
        if (main != null) {
				contractmainDao.delete(id);

				contractdetailDao.deleteByBillNo(main.getBillno());

        }

	}
	
	@Override
    public void deleteBatch(Long[] ids){
			contractmainDao.deleteBatch(ids);
    }


    @Override
    public void auditBatch(Long[] ids){
			contractmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids){
			contractmainDao.unauditBatch(ids);
    }
}
