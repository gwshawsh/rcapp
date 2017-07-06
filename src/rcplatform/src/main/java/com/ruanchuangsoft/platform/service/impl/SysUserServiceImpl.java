package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.SysUserDao;
import com.ruanchuangsoft.platform.entity.SysUserEntity;
import com.ruanchuangsoft.platform.service.SysUserRoleService;
import com.ruanchuangsoft.platform.service.SysUserService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.User;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 系统用户
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:46:09
 */
@Service
public class SysUserServiceImpl implements SysUserService {
	@Autowired
	private SysUserDao sysUserDao;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private IdentityService identityService;

	@Override
	public List<String> queryAllPerms(Long userId) {
		return sysUserDao.queryAllPerms(userId);
	}

	@Override
	public List<String> queryAllMenuId(Long userId) {
		return sysUserDao.queryAllMenuId(userId);
	}

	@Override
	public SysUserEntity queryByUserName(String username) {
		return sysUserDao.queryByUserName(username);
	}
	
	@Override
	public SysUserEntity queryObject(Long userId) {
		return sysUserDao.queryObject(userId);
	}

	@Override
	public List<SysUserEntity> queryList(Map<String, Object> map){
		return sysUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysUserDao.queryTotal(map);
	}

	@Override
	@Transactional
	public void save(SysUserEntity user) {
		user.setCreateTime(new Date());
		//sha256加密
		user.setPassword(new Sha256Hash(user.getPassword()).toHex());
		sysUserDao.save(user);
		
		//保存用户与角色关系
		sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());


		//更新到工作流中
		User userWork=identityService.newUser(String.valueOf(user.getId()));
		userWork.setFirstName(user.getUsername());
		identityService.saveUser(userWork);

		//更新工作流角色
		for (Long roleid :
				user.getRoleIdList()) {
			identityService.createMembership(String.valueOf(user.getId()),String.valueOf(roleid));
		}

	}

	@Override
	@Transactional
	public void update(SysUserEntity user) {
		if(StringUtils.isBlank(user.getPassword())){
			user.setPassword(null);
		}else{
			user.setPassword(new Sha256Hash(user.getPassword()).toHex());
		}
		sysUserDao.update(user);
		
		//保存用户与角色关系
		sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());

		//更新工作流用户
		User userWork=identityService.createUserQuery().userId(String.valueOf(user.getId())).singleResult();
		if(userWork!=null) {
			userWork.setFirstName(user.getUsername());
			identityService.saveUser(userWork);
		}

		//更新工作流角色
		for (Long roleid :
				user.getRoleIdList()) {
			//检测是否存在
			identityService.deleteMembership(String.valueOf(user.getId()),String.valueOf(roleid));
			identityService.createMembership(String.valueOf(user.getId()),String.valueOf(roleid));
		}

	}

	@Override
	@Transactional
	public void deleteBatch(Long[] userIds) {
		sysUserDao.deleteBatch(userIds);
		for (long id :
				userIds) {
			identityService.deleteUser(String.valueOf(id));
		}
	}

	@Override
	public int updatePassword(Long userId, String password, String newPassword) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("password", password);
		map.put("newPassword", newPassword);
		return sysUserDao.updatePassword(map);
	}
}
