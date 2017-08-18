package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.CheckinmainEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 签到表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-14 10:36:04
 */
@Mapper
public interface CheckinmainDao extends BaseDao<CheckinmainEntity> {
    @Select("select * from checkinmain where username=#{usercode} and date>= #{begin} and date<=#{end}")
    List<CheckinmainEntity> queryListInterval(@Param("usercode")String usercode, @Param("begin")Date begin, @Param("end")Date end);
}
