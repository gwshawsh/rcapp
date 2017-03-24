package com.ruanchuangsoft.platform.config;

import com.ruanchuangsoft.platform.shiro.ShiroExt;
import org.beetl.core.GroupTemplate;
import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.core.resource.WebAppResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;

import java.io.IOException;

/**
 * Created by lidongfeng on 2017/3/23.
 */
@Configuration
public class MvcConfiguration{
          String templatesPath="/templates/page/";//模板跟目录
        @Bean(initMethod = "init", name = "beetlConfig")
        public BeetlGroupUtilConfiguration getBeetlGroupUtilConfiguration() {
            BeetlGroupUtilConfiguration beetlGroupUtilConfiguration = new BeetlGroupUtilConfiguration();
            ResourcePatternResolver patternResolver = ResourcePatternUtils.getResourcePatternResolver(new DefaultResourceLoader());

            try {
                String root =  patternResolver.getResource("classpath:templates").getFile().toString();
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
            BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
            beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
            beetlSpringViewResolver.setOrder(0);
            beetlSpringViewResolver.setConfig(beetlGroupUtilConfiguration);

            beetlSpringViewResolver.setSuffix(".html");
            return beetlSpringViewResolver;
        }
}
