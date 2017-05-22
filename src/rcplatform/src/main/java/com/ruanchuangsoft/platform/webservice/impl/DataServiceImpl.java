package com.ruanchuangsoft.platform.webservice.impl;

import com.ruanchuangsoft.platform.webservice.DataService;

import javax.jws.WebService;

/**
 * Created by lidongfeng on 2017/5/17.
 */
@WebService(targetNamespace="http://trans.ruanchuangsoft.com/",endpointInterface = "com.ruanchuangsoft.platform.webservice.DataService")
public class DataServiceImpl implements DataService {
    @Override
    public String saveData(String name, String oper, String data) {
        return "lidongfeng";
    }

    @Override
    public String getData(String name, String oper, String params) {
        return "lidongfeng2";
    }
}
