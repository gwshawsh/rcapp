package com.ruanchuangsoft.platform.utils.generator;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * Created by lidongfeng on 2017/6/10.
 */
public class VelocityUtils {
    /**
     * 是否是日期字段
     * @param columnname  列名
     * @return   true：是     false：否
     */
    public boolean isdate(String columnname) {
        if(columnname.endsWith("date")){
            return true;
        }
        else{
            return false;
        }
    }
}
