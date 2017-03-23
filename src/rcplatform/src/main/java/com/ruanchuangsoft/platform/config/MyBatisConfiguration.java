package com.ruanchuangsoft.platform.config;

/**
 * Created by lidongfeng on 2017/3/23.
 */
import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/**
 * springboot集成mybatis的基本入口
 * 1）创建数据源
 * 2）创建SqlSessionFactory
 */
@Configuration
@MapperScan(basePackages = "com.ruanchuangsoft.platform.system.dao")
public class MyBatisConfiguration {


    @Autowired
    private Environment env;

    /**
     * 创建数据源
     *
     * @Primary 该注解表示在同一个接口有多个实现类可以注入的时候，默认选择哪一个，而不是让@autowire注解报错
     */
    @Bean(name="dataSource",destroyMethod = "close", initMethod = "init")
    public DataSource writeDataSource() {
        System.out.println("注入druid！！！");
        DruidDataSource datasource = new DruidDataSource();
        datasource.setUrl(env.getProperty("spring.datasource.url"));
        datasource.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
        datasource.setUsername(env.getProperty("spring.datasource.username"));
        datasource.setPassword(env.getProperty("spring.datasource.password"));
        datasource.setInitialSize(Integer.valueOf(env.getProperty("spring.datasource.initialSize")));
        datasource.setMinIdle(Integer.valueOf(env.getProperty("spring.datasource.minIdle")));
        datasource.setMaxWait(Long.valueOf(env.getProperty("spring.datasource.maxWait")));
        datasource.setMaxActive(Integer.valueOf(env.getProperty("spring.datasource.maxActive")));
        datasource.setMinEvictableIdleTimeMillis(Long.valueOf(env.getProperty("spring.datasource.minEvictableIdleTimeMillis")));
        return datasource;
    }
    /**
     * 根据数据源创建SqlSessionFactory
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource ds) throws Exception {
        SqlSessionFactoryBean fb = new SqlSessionFactoryBean();
        fb.setConfigLocation(new ClassPathResource("mybatis.xml"));
        fb.setDataSource(ds);//指定数据源(这个必须有，否则报错)
        //下边两句仅仅用于*.xml文件，如果整个持久层操作不需要使用到xml文件的话（只用注解就可以搞定），则不加
        fb.setTypeAliasesPackage(env.getProperty("mybatis.type-aliases-package"));//指定基包
        fb.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(env.getProperty("mybatis.mapper-locations")));//指定xml文件位置

        return fb.getObject();
    }

}
