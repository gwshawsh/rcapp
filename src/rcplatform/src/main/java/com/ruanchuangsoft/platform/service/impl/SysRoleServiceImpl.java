package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.SysRoleDao;
import com.ruanchuangsoft.platform.entity.SysRoleEntity;
import com.ruanchuangsoft.platform.service.SysRoleMenuService;
import com.ruanchuangsoft.platform.service.SysRoleService;
import com.ruanchuangsoft.platform.service.SysUserRoleService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 角色
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:45:12
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleDao sysRoleDao;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private IdentityService identityService;

    @Override
    public SysRoleEntity queryObject(Long roleId) {
        return sysRoleDao.queryObject(roleId);
    }

    @Override
    public List<SysRoleEntity> queryList(Map<String, Object> map) {
        return sysRoleDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysRoleDao.queryTotal(map);
    }

    @Override
    @Transactional
    public void save(SysRoleEntity role) {
        role.setCreateTime(new Date());
        sysRoleDao.save(role);

        //保存角色与菜单关系
        sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());

        //保存工作流用户组
        Group group = identityService.newGroup(String.valueOf(role.getRoleId()));
        group.setName(role.getRoleName());
        group.setType("assignment");
        identityService.saveGroup(group);

    }

    @Override
    @Transactional
    public void update(SysRoleEntity role) {
        sysRoleDao.update(role);

        //更新角色与菜单关系
        sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());


        //更新工作流用户组
        Group group = identityService.createGroupQuery().groupId(String.valueOf(role.getRoleId())).singleResult();
        if (group == null) {
            group = identityService.newGroup(String.valueOf(role.getRoleId()));
            group.setName(role.getRoleName());
            group.setType("assignment");
            identityService.saveGroup(group);
        } else {
            group.setName(role.getRoleName());
            identityService.saveGroup(group);
        }

    }

    @Override
    @Transactional
    public void deleteBatch(Long[] roleIds) {
        sysRoleDao.deleteBatch(roleIds);


    }

}
