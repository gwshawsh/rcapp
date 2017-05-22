package com.ruanchuangsoft.platform.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.ruanchuangsoft.platform.shiro.ShiroExt;
import org.beetl.core.GroupTemplate;
import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.core.resource.WebAppResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.web.servlet.DispatcherServlet;

import java.io.IOException;

/**
 * Created by lidongfeng on 2017/3/23.
 */
@Configuration
public class MvcConfiguration {
    String templatesPath = "/templates/page/";//模板跟目录

    @Bean(initMethod = "init", name = "beetlConfig")
    public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
        BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
        ResourcePatternResolver patternResolver = ResourcePatternUtils.getResourcePatternResolver(new DefaultResourceLoader());

        try {
            String root = patternResolver.getResource("classpath:templates/page/").getFile().toString();
            WebAppResourceLoader webAppResourceLoader = new WebAppResourceLoader(root);
            beetlGroupUtilConfiguration.setResourceLoader(webAppResourceLoader);
            beetlGroupUtilConfiguration.setConfigFileResource(patternResolver.getResource("classpath:beetl.properties"));

            return beetlGroupUtilConfiguration;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Bean(name = "beetlViewResolver")
    public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
        //
        GroupTemplate gt = beetlGroupUtilConfiguration.getGroupTemplate();
        //注册权限
        gt.registerFunctionPackage("shiro", new ShiroExt());

        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);

        beetlSpringViewResolver.setSuffix(".html");
        return beetlSpringViewResolver;
    }

//    @Bean
//    public ServletRegistrationBean setActivitiModeler(){
//        //org.springframework.boot.context.embedded.ServletRegistrationBean提供类的进行注册.
//        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new DispatcherServlet(),"/service/*");
//        servletRegistrationBean.addInitParameter("contextConfigLocation", "classpath:spring-mvc-modeler.xml");
//        return servletRegistrationBean;
//
//    }
//
//    @Bean
//    public ServletRegistrationBean setActivitiRest(){
//        //org.springframework.boot.context.embedded.ServletRegistrationBean提供类的进行注册.
//        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new DispatcherServlet(),"/rest/*");
//        servletRegistrationBean.addInitParameter("contextConfigLocation", "classpath:spring-mvc-rest.xml");
//        return servletRegistrationBean;
//
//    }

}
