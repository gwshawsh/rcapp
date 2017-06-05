package com.ruanchuangsoft.platform.webservice.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruanchuangsoft.platform.entity.BaseOpBankEntity;
import com.ruanchuangsoft.platform.entity.SysUserEntity;
import com.ruanchuangsoft.platform.service.BaseOpBankService;
import com.ruanchuangsoft.platform.service.SysUserService;
import com.ruanchuangsoft.platform.webservice.DataService;
import com.ruanchuangsoft.platform.webservice.SoapComResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.jws.WebService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lidongfeng on 2017/5/17.
 */
@WebService(targetNamespace="http://webservice.platform.ruanchuangsoft.com/",endpointInterface = "com.ruanchuangsoft.platform.webservice.DataService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class DataServiceImpl implements DataService {
    @Autowired
    SysUserService userService;

    @Autowired
    BaseOpBankService baseOpBankService;


    @Override
    public String saveData(String tablename, String oper, String data) {
        String result="";
        if(tablename.equals("user")){
            Map<String, Object> map = new HashMap<>();
            List<SysUserEntity> list=userService.queryList(map);
             result =JSON.toJSONString(list);

        }
        else if(tablename.equalsIgnoreCase("Base_Op_Bank")){
            List<BaseOpBankEntity> lst= JSON.parseArray(data,BaseOpBankEntity.class);

            for (BaseOpBankEntity item:lst
                 ) {
                if(oper.equalsIgnoreCase("insert")) {
                    baseOpBankService.save(item);
                }
                else if(oper.equalsIgnoreCase("update")){
                    baseOpBankService.update(item);
                }
                else if(oper.equalsIgnoreCase("delete")){
                    baseOpBankService.delete(item.getBobTid());
                }
            }

            SoapComResult rst=new SoapComResult();
            rst.setCode(0);
            rst.setMessage("处理数据成功");
            result= JSON.toJSONString(rst);

        }
        return result;
    }

    @Override
    public String getData(String tablename, String params) {
        String result="";
        Map<String, Object> map = JSON.parseObject(
                params,new TypeReference<Map<String, Object>>(){} );
        if(tablename.equals("user")){
            List<SysUserEntity> list=userService.queryList(map);
            result =JSON.toJSONString(list);
        }
        else if(tablename.equalsIgnoreCase("Base_Op_Bank")){
            List<BaseOpBankEntity> list=baseOpBankService.queryList(map);
            result =JSON.toJSONString(list);
        }
        return result;
    }
}
