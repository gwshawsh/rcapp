package com.ruanchuangsoft.platform.config;

/**
 * Created by lidongfeng on 2017/3/23.
 */
import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import java.sql.SQLException;

/**
 * springboot集成mybatis的基本入口
 * 1）创建数据源
 * 2）创建SqlSessionFactory
 */
@Configuration
@MapperScan(basePackages = "com.ruanchuangsoft.platform.dao")
public class MyBatisConfiguration {


    @Autowired
    private Environment env;

    /**
     * 创建数据源
     *
     * @Primary 该注解表示在同一个接口有多个实现类可以注入的时候，默认选择哪一个，而不是让@autowire注解报错
     */
    @Bean(name="dataSource",destroyMethod = "close", initMethod = "init")
    public DataSource writeDataSource() throws SQLException{
        JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

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
        datasource.setFilters(env.getProperty("spring.datasource.filters"));
        return datasource;
    }
    /**
     * 根据数据源创建SqlSessionFactory
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean fb = new SqlSessionFactoryBean();
        fb.setConfigLocation(new ClassPathResource("mybatis.xml"));
        fb.setDataSource(dataSource);//指定数据源(这个必须有，否则报错)
        //下边两句仅仅用于*.xml文件，如果整个持久层操作不需要使用到xml文件的话（只用注解就可以搞定），则不加
        fb.setTypeAliasesPackage(env.getProperty("mybatis.type-aliases-package"));//指定基包
        fb.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(env.getProperty("mybatis.mapper-locations")));//指定xml文件位置

        return fb.getObject();
    }

    @Bean
    public PlatformTransactionManager annotationDrivenTransactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }



    @Bean
    public ServletRegistrationBean DruidStatViewServle2(){
        //org.springframework.boot.context.embedded.ServletRegistrationBean提供类的进行注册.
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        //添加初始化参数：initParams
        //白名单：
        servletRegistrationBean.addInitParameter("allow","127.0.0.1");
        //IP黑名单 (存在共同时，deny优先于allow) : 如果满足deny的话提示:Sorry, you are not permitted to view this page.
        // servletRegistrationBean.addInitParameter("deny","192.168.1.73");
        //登录查看信息的账号密码.
//        servletRegistrationBean.addInitParameter("loginUsername","admin");
//        servletRegistrationBean.addInitParameter("loginPassword","123456");
        //是否能够重置数据.
        servletRegistrationBean.addInitParameter("resetEnable","false");


        return servletRegistrationBean;

    }



    /**

     * 注册一个：filterRegistrationBean

     * @return

     */

    @Bean
    public FilterRegistrationBean druidStatFilter(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }



}
