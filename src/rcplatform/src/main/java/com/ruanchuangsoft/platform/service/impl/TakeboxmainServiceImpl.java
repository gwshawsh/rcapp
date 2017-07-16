package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TakeboxmainDao;
import com.ruanchuangsoft.platform.dao.TakeboxdetailDao;
import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;
import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.service.TakeboxmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("takeboxmainService")
public class TakeboxmainServiceImpl implements TakeboxmainService {
    @Autowired
    private TakeboxmainDao takeboxmainDao;

    @Autowired
    private TakeboxdetailDao takeboxdetailDao;


    @Override
    public TakeboxmainEntity queryObject(Long id) {
        return takeboxmainDao.queryObject(id);
    }

    @Override
    public List<TakeboxmainEntity> queryList(Map<String, Object> map) {
        return takeboxmainDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return takeboxmainDao.queryTotal(map);
    }

    @Override
    public void save(TakeboxmainEntity takeboxmain) {
        if (takeboxmain.getDetails() != null) {
            for (TakeboxdetailEntity item : takeboxmain.getDetails()) {
                takeboxdetailDao.save(item);
            }
        }
        takeboxmainDao.save(takeboxmain);
    }

    @Override
    public void update(TakeboxmainEntity takeboxmain) {
        if (takeboxmain.getDetails() != null) {
            for (TakeboxdetailEntity item : takeboxmain.getDetails()) {
                takeboxdetailDao.update(item);
            }
        }
        takeboxmainDao.update(takeboxmain);
    }

    @Override
    public void delete(Long id) {
        TakeboxmainEntity main = queryObject(id);
        if (main != null) {
            takeboxmainDao.delete(id);

            takeboxdetailDao.deleteByBillNo(main.getBillno());

        }

    }

    @Override
    public void deleteBatch(Long[] ids) {
        takeboxmainDao.deleteBatch(ids);
    }

    @Override
    public void auditBatch(Long[] ids) {
        takeboxmainDao.auditBatch(ids);
    }

    @Override
    public void unauditBatch(Long[] ids) {
        takeboxmainDao.unauditBatch(ids);
    }
}
