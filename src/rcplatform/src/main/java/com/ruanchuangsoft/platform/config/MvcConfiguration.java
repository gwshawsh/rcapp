package com.ruanchuangsoft.platform.config;

import com.ruanchuangsoft.platform.shiro.ShiroExt;
import org.beetl.core.GroupTemplate;
import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by lidongfeng on 2017/3/23.
 */
@Configuration
public class MvcConfiguration{
          String templatesPath="/templates/page/";//模板跟目录
        @Bean(initMethod = "init", name = "beetlConfig")
        public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
            BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
            try {
                ClasspathResourceLoader cploder = new ClasspathResourceLoader(MvcConfiguration.class.getClassLoader(),templatesPath);
                beetlGroupUtilConfiguration.setResourceLoader(cploder);

//                beetlGroupUtilConfiguration.getGroupTemplate().registerFunctionPackage("shiro",new ShiroExt());
                return beetlGroupUtilConfiguration;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }

        @Bean(name = "beetlViewResolver")
        public BeetlSpringViewResolver getBeetlSpringViewResolver(@Qualifier("beetlConfig") BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
            BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
            beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
            beetlSpringViewResolver.setOrder(0);
            beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);

            beetlSpringViewResolver.setSuffix(".html");
            return beetlSpringViewResolver;
        }
}
