package com.ruanchuangsoft.platform.webservice;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * Created by lidongfeng on 2017/5/17.
 */
@WebService
public interface DataService {
    @WebMethod
    String saveData(String name,String oper,String data);

    @WebMethod
    String getData(String name,String params);
}
