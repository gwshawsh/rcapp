package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.AttachmentsDao;
import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
import com.ruanchuangsoft.platform.service.AttachmentsService;
import org.springframework.transaction.annotation.Transactional;


@Service("attachmentsService")
public class AttachmentsServiceImpl implements AttachmentsService {
	@Autowired
	private AttachmentsDao attachmentsDao;
	
	@Override
	public AttachmentsEntity queryObject(Long id){
		return attachmentsDao.queryObject(id);
	}
	
	@Override
	public List<AttachmentsEntity> queryList(Map<String, Object> map){
		return attachmentsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return attachmentsDao.queryTotal(map);
	}
	
	@Override
	public void save(AttachmentsEntity attachments){
		attachmentsDao.save(attachments);
	}
	
	@Override
	public void update(AttachmentsEntity attachments){
		attachmentsDao.update(attachments);
	}
	
	@Override
	public void delete(Long id){
		attachmentsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		attachmentsDao.deleteBatch(ids);
	}
	
}
