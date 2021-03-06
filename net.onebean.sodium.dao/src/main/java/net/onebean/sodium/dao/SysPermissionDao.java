package net.onebean.sodium.dao;

import net.onebean.core.base.BaseSplitDao;
import net.onebean.sodium.vo.MenuTree;
import net.onebean.sodium.model.SysPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysPermissionDao extends BaseSplitDao <SysPermission> {

    /**
     * 根据用户查找菜单
     * @param userId
     * @return
     */
    List<SysPermission> findByUserId(@Param("userId")String userId,@Param("tableSuffix")String tableSuffix);

    /**
     * 异步查找子节点,每次查找一级
     * @param parentId 父级id
     * @param dp 数据权限sql
     * @return
     */
    List<MenuTree> findChildAsync(@Param("parentId") Long parentId,@Param("tableSuffix")String tableSuffix, @Param("dp") Map<String,Object> dp);

    /**
     * 根据id删除自身以及自项
     * @param id
     */
    void deleteSelfAndChildById(@Param("id")Long id,@Param("tableSuffix")String tableSuffix);

    /**
     * 根据父ID查找下一个排序值
     * @param parentId
     * @return
     */
    Integer findChildOrderNextNum(@Param("parentId") Long parentId,@Param("tableSuffix")String tableSuffix);

    /**
     * 获取所有父级ID
     * @param childId
     * @return pids
     */
    String getParentMenuIds(@Param("childId")Long childId,@Param("tableSuffix")String tableSuffix);

}