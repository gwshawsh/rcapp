package com.ruanchuangsoft.platform.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.ruanchuangsoft.platform.shiro.ShiroExt;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;
import org.springframework.web.servlet.view.velocity.VelocityLayoutViewResolver;
import org.springframework.web.servlet.view.velocity.VelocityViewResolver;
import sun.rmi.rmic.iiop.ClassPathLoader;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by lidongfeng on 2017/3/23.
 */
@Configuration
public class MvcConfiguration {
    String templatesPath = "/templates/page/";//模板跟目录

//    @Bean
//    public VelocityViewResolver getVelocityViewResolver(){
//        VelocityViewResolver vvw = new VelocityViewResolver();
//        vvw.setPrefix(templatesPath);
//        vvw.setSuffix( ".html" );
//        // TODO in production we might actuall enable caching
//        vvw.setCache( false );
//        vvw.setContentType("text/html;charset=UTF-8");
//        vvw.setRequestContextAttribute("rc");
//        vvw.setExposeSpringMacroHelpers( true );
//        ClasspathResourceLoader classpathResourceLoader=new ClasspathResourceLoader();
//
//        ClassPathResource path=new ClassPathResource("/templates/page/velocity-toolbox.xml");
//        String str=path.getPath();
//        vvw.setToolboxConfigLocation(str);
//        return vvw;
//    }
//
//    @Bean
//    public VelocityConfigurer getVelocityConfigurer(){
//        VelocityConfigurer configurer=new VelocityConfigurer();
//        configurer.setResourceLoaderPath(templatesPath);
////        Map<String,Object> props=new HashMap<>();
//        Properties props=new Properties();
//        props.put("charset","UTF-8");
//        props.put("input.encoding","UTF-8");
//        props.put("output.encoding","UTF-8");
//        props.put("contentType","text/html;charset=UTF-8");
//        configurer.setVelocityProperties(props);
//        return configurer;
//    }

//
//    @Bean(initMethod = "init", name = "beetlConfig")
//    public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
//        BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
//        ResourcePatternResolver patternResolver = ResourcePatternUtils.getResourcePatternResolver(new DefaultResourceLoader());
//
//        try {
//            String root = patternResolver.getResource("classpath:templates/page/").getFile().toString();
//            ClasspathResourceLoader webAppResourceLoader = new ClasspathResourceLoader(root);
////            WebAppResourceLoader webAppResourceLoader=new WebAppResourceLoader(root);
//            beetlGroupUtilConfiguration.setResourceLoader(webAppResourceLoader);
//
//            beetlGroupUtilConfiguration.setConfigFileResource(patternResolver.getResource("classpath:beetl.properties"));
//
//            return beetlGroupUtilConfiguration;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//
//    }
//
//    @Bean(name = "beetlViewResolver")
//    public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
//        //
//        GroupTemplate gt = beetlGroupUtilConfiguration.getGroupTemplate();
//        //注册权限
//        gt.registerFunctionPackage("shiro", new ShiroExt());
//
//        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
//        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
//        beetlSpringViewResolver.setOrder(0);
//        beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);
//
//        beetlSpringViewResolver.setSuffix(".html");
//        return beetlSpringViewResolver;
//    }

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
