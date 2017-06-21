package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 放箱计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-21 19:55:19
 */
@Mapper
public interface TakeboxdetailDao extends BaseDao<TakeboxdetailEntity> {
    int deleteByBillNo(String billno);
}
