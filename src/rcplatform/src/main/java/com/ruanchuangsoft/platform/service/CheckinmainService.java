package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.CheckinmainEntity;
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
public interface CheckinmainService {
	
	CheckinmainEntity queryObject(Long id);
	
	List<CheckinmainEntity> queryList(Map<String, Object> map);


	List<CheckinmainEntity> queryListInterval(String usercode, Date begin, Date end);

	int queryTotal(Map<String, Object> map);
	
	void save(CheckinmainEntity checkinmain);
	
	void update(CheckinmainEntity checkinmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
