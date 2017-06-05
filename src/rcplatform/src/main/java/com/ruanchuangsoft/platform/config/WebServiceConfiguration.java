package com.ruanchuangsoft.platform.config;

import com.ruanchuangsoft.platform.webservice.DataService;
import com.ruanchuangsoft.platform.webservice.impl.DataServiceImpl;
import org.apache.cxf.Bus;
import org.apache.cxf.bus.spring.SpringBus;

import javax.xml.ws.Endpoint;

import org.apache.cxf.jaxws.EndpointImpl;
import org.apache.cxf.transport.servlet.CXFServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;

/**
 * Created by lidongfeng on 2017/5/17.
 */
@Configuration
public class WebServiceConfiguration {


    //    @Bean
//    public ServletRegistrationBean dispatcherServlet() {
//        return new ServletRegistrationBean(new CXFServlet(), "/webdata/*");
//    }
    @Bean
    public ServletRegistrationBean servletRegistrationBean() {
        ServletRegistrationBean bean = new ServletRegistrationBean(new CXFServlet(), "/soap/*");
//        bean.setLoadOnStartup(0);
//        bean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        return bean;
    }

    @Bean(name = Bus.DEFAULT_BUS_ID)
    public SpringBus springBus() {
        return new SpringBus();
    }

    @Bean
    public DataService dataService() {
        return new DataServiceImpl();
    }

    @Bean
    public Endpoint endpoint1() {
        EndpointImpl endpoint = new EndpointImpl(springBus(), dataService());
        endpoint.publish("/datacom");
        return endpoint;
    }


}
