package com.ruanchuangsoft.platform.service.impl;

import com.alibaba.fastjson.JSON;
import com.mongodb.gridfs.CLI;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.entity.tms.OrderTruck;
import com.ruanchuangsoft.platform.service.TMSService;
import com.ruanchuangsoft.platform.service.TransboxdetailService;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lidongfeng on 2017/7/18.
 */
@Service("tmsService")
public class TMSServiceImpl implements TMSService {
    @Autowired
    TransboxmainService transboxmainService;

    @Autowired
    TransboxdetailService transboxdetailService;

    public static Client client;

    @Value("${rcp.tmsweburl}")
    private String tmsweburl;

    public Client getClient(){
        try {
            if(client==null) {
                JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
                Client client = dcf.createClient(tmsweburl);
            }

            return client;

        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    @Override
    public boolean sendOrderTruck(Long id) {
        TransboxmainEntity transboxmainEntity= transboxmainService.queryObject(id);

        Map<String, Object> map = new HashMap<>();
        map.put("offset",0);
        map.put("limit", 1000);
        map.put("billno",transboxmainEntity.getBillno());

        //查询明细数据
        List<TransboxdetailEntity> transboxdetailList = transboxdetailService.queryList(map);

        OrderTruck orderTruck=new OrderTruck();
        if(transboxmainEntity.getRefbilltype()==5) {
            orderTruck.setTruckType("进口");
        }
        else{
            orderTruck.setTruckType("出口");
        }
//        orderTruck.setSStation(transboxmainEntity.);
        orderTruck.setBillNumber(transboxmainEntity.getBillno());

        Client client=getClient();
//        client.invoke("OrderTruck",);

        return false;
    }

    @Override
    public boolean sendLine(Long id) {
        return false;
    }

    @Override
    public boolean sendUnit(Long id) {
        return false;
    }

    @Override
    public boolean sendFeeitem(Long id) {
        return false;
    }

    @Override
    public boolean sendCurrency(Long id) {
        return false;
    }

    @Override
    public boolean sendBank(Long id) {
        return false;
    }

    @Override
    public boolean sendOperator(Long id) {
        return false;
    }
}
