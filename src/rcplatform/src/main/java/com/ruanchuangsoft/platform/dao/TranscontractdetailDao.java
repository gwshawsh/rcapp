package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运输合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:08:04
 */
@Mapper
public interface TranscontractdetailDao extends BaseDao<TranscontractdetailEntity> {
    int deleteByBillNo(String billno);
}
