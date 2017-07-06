package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 请购明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 00:21:21
 */
@Mapper
public interface RequisitiondetailDao extends BaseDao<RequisitiondetailEntity> {
    int deleteByBillNo(String billno);
}
