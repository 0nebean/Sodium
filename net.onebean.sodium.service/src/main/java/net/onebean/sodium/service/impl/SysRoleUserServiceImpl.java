package net.onebean.sodium.service.impl;
import net.onebean.sodium.dao.SysRoleUserDao;
import net.onebean.sodium.model.SysRoleUser;
import net.onebean.sodium.service.SysRoleUserService;
import net.onebean.core.base.BaseSplitBiz;
import net.onebean.core.query.Condition;
import net.onebean.util.CollectionUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysRoleUserServiceImpl extends BaseSplitBiz <SysRoleUser, SysRoleUserDao> implements SysRoleUserService {

    @Override
    public void deleteByUserId(Long userId) {
        baseDao.deleteByUserId(userId,getTenantId());
    }

    @Override
    public void deleteByRoleId(Long roleId) {
        baseDao.deleteByRoleId(roleId,getTenantId());
    }

    @Override
    public void save(SysRoleUser entity) {
        List<Condition> params = new ArrayList<>();
        Condition c1 = Condition.parseModelCondition("sysRoleId@int@eq$");
        c1.setValue(entity.getSysRoleId());
        Condition c2 = Condition.parseModelCondition("sysUserId@int@eq$");
        c2.setValue(entity.getSysUserId());
        params.add(c1);
        params.add(c2);
        if(CollectionUtil.isEmpty(this.find(null,params))){
            super.save(entity);
        }
    }

    @Override
    public List<SysRoleUser> findbyRoleId(Object roleId) {
        Condition param = Condition.parseModelCondition("sysRoleId@int@eq");
        param.setValue(roleId);
        return find(null,param);
    }
}