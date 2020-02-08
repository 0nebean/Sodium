package net.onebean.sodium.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Optional;

/**
 * 自定义实现的security拦截器,指定了权限校验规则类 MyAccessDecisionManager
 * @author 0neBean
 */
@Service
public class OneBeanFilterSecurityInterceptor extends AbstractSecurityInterceptor implements Filter {


    @Autowired
    private FilterInvocationSecurityMetadataSource securityMetadataSource;

    @Autowired
    public void setMyAccessDecisionManager(OneBeanAccessDecisionManager myAccessDecisionManager) {
        super.setAccessDecisionManager(myAccessDecisionManager);
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        FilterInvocation fi = new FilterInvocation(request, response, chain);
        invoke(fi);
    }


    public void invoke(FilterInvocation fi) throws IOException, ServletException {
        String uri = Optional.of(fi).map(FilterInvocation::getHttpRequest).map(HttpServletRequest::getRequestURI).orElse("");
        logger.debug("OneBeanFilterSecurityInterceptor invoke method,get request uri = " + uri);
        InterceptorStatusToken token = super.beforeInvocation(fi);
        try {
            //执行下一个拦截器
            fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
        } finally {
            super.afterInvocation(token, null);
        }
    }


    @Override
    public void destroy() {

    }

    @Override
    public Class<?> getSecureObjectClass() {
        return FilterInvocation.class;

    }

    @Override
    public SecurityMetadataSource obtainSecurityMetadataSource() {
        return this.securityMetadataSource;
    }
}
