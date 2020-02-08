package net.onebean.sodium.service.impl;

import com.alibaba.fastjson.JSONObject;
import net.onebean.core.base.BaseBiz;
import net.onebean.core.error.BusinessException;
import net.onebean.sodium.common.error.ErrorCodesEnum;
import net.onebean.sodium.dao.TenantInfoDao;
import net.onebean.sodium.model.TenantInfo;
import net.onebean.sodium.service.TenantInfoService;
import net.onebean.util.FreeMarkerTemplateUtils;
import net.onebean.util.PropUtil;
import net.onebean.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author 0neBean
* @description 租户管理 serviceImpl
* @date 2019-02-13 15:05:06
*/
@Service
public class TenantInfoServiceImpl extends BaseBiz<TenantInfo, TenantInfoDao> implements TenantInfoService {

    private static final Logger logger = LoggerFactory.getLogger(TenantInfoServiceImpl.class);


    private static final String TEMPLATE_FILE = "tenant/initTenantInfo.ftl";



    @Override
    public void initTenantInfoTableAndFunctionBySql(String tenantId) {
        logger.info("started init tenant into database table");
        if (StringUtils.isEmpty(baseDao.isExistTenantInfo(tenantId))){
            //根据生成模板生成sql语句
            String sqlStr = mergeTemplate(tenantId);
            Integer res = baseDao.initTenantDataBaseInfo(sqlStr);
            if (null == res){
                throw new BusinessException(ErrorCodesEnum.INIT_TENANT_INFO_ERROR.code(),ErrorCodesEnum.INIT_TENANT_INFO_ERROR.msg());
            }
        }
    }

    /**
     * 根据生成模板生成sql语句
     * @param tenantId 租户ID
     * @return sql
     */
    private String mergeTemplate(String tenantId) {
        JSONObject param = new JSONObject();
        param.put("tenantId",tenantId);
        return FreeMarkerTemplateUtils.generateStringFromFreeMarker(param,TEMPLATE_FILE);
    }

    @Override
    public void deleteByTenantIds(List<Long> deletedTenantIds) {
        baseDao.deleteByTenantIds(deletedTenantIds);
    }
}