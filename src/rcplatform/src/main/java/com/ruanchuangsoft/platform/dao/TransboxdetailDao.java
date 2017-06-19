package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运输计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 00:43:25
 */
@Mapper
public interface TransboxdetailDao extends BaseDao<TransboxdetailEntity> {
    int deleteByBillNo(String billno);
}
