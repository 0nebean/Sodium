package net.onebean.sodium.security;

import net.onebean.sodium.model.SysPermission;
import net.onebean.sodium.service.SysPermissionService;
import net.onebean.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

/**
 * 资源初始化拦截器,
 * 所有用到的静态权限资源在这里加载
 * 0neBean
 */
@Service
public class OneBeanInvocationSecurityMetadataSourceService implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private SysPermissionService sysPermissionService;

    private HashMap<String, Collection<ConfigAttribute>> map = null;

    /**
     * 加载资源，初始化资源变量
     */
    private void loadResourceDefine(){
        map = new HashMap<>();
        Collection<ConfigAttribute> array;
        ConfigAttribute cfg;
        for(SysPermission permission : sysPermissionService.findAll()) {
            array = new ArrayList<>();
            cfg = new SecurityConfig(permission.getName());
            array.add(cfg);
            map.put(permission.getUrl(), array);
        }
    }



    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
        if(map == null && isUnSecuredUrls(request)){
            loadResourceDefine();
        }else if(map != null && map.size() > 0){
            AntPathRequestMatcher matcher;
            String resUrl;
            for(Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
                resUrl = iter.next();
                if (StringUtils.isEmpty(resUrl)){
                    //如果url为空 不加载该url资源
                    return null;
                }
                matcher = new AntPathRequestMatcher(resUrl);
                if(matcher.matches(request)) {
                    return map.get(resUrl);
                }
            }
        }
        return null;
    }

    /**
     * 是否白名单url
     * @param request req
     * @return bool
     */
    private Boolean isUnSecuredUrls(HttpServletRequest request){
        String[] unSecuredUrls = OneBeanAccessWhiteList.unSecuredUrls;
        AntPathRequestMatcher matcher;
        for (String s : unSecuredUrls) {
            matcher = new AntPathRequestMatcher(s);
            if(matcher.matches(request)) {
                return false;
            }
        }
        return true;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }
}
