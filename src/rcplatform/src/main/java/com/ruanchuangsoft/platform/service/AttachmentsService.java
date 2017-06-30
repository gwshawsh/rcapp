package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.AttachmentsEntity;

import java.util.List;
import java.util.Map;

/**
 * 附件表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-30 15:41:55
 */
public interface AttachmentsService {
	
	AttachmentsEntity queryObject(Long id);
	
	List<AttachmentsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(AttachmentsEntity attachments);
	
	void update(AttachmentsEntity attachments);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
