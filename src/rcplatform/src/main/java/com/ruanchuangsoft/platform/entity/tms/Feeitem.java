package com.ruanchuangsoft.platform.entity.tms;

/**
 * Created by lidongfeng on 2017/7/18.
 */
public class Feeitem {
    private String Name;

    private String HelpCode;

    public void setName(String Name){
        this.Name = Name;
    }
    public String getName(){
        return this.Name;
    }
    public void setHelpCode(String HelpCode){
        this.HelpCode = HelpCode;
    }
    public String getHelpCode(){
        return this.HelpCode;
    }
}
