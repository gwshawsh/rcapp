package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.TakeboxdetailDao;
import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TakeboxmainDao;
import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;
import com.ruanchuangsoft.platform.service.TakeboxmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("takeboxmainService")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
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
        takeboxmainDao.save(takeboxmain);
        for (TakeboxdetailEntity item : takeboxmain.getDetails()) {
            takeboxdetailDao.save(item);
        }
    }

    @Override
    public void update(TakeboxmainEntity takeboxmain) {
        takeboxmainDao.update(takeboxmain);
        for (TakeboxdetailEntity item : takeboxmain.getDetails()) {
            takeboxdetailDao.save(item);
        }
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

}
