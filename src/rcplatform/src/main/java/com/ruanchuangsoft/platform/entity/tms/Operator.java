package com.ruanchuangsoft.platform.entity.tms;

/**
 * Created by lidongfeng on 2017/7/18.
 */
public class Operator {
    private String LogName;

    private String Name;

    private String PassWord;

    private String Phone;

    public void setLogName(String LogName){
        this.LogName = LogName;
    }
    public String getLogName(){
        return this.LogName;
    }
    public void setName(String Name){
        this.Name = Name;
    }
    public String getName(){
        return this.Name;
    }
    public void setPassWord(String PassWord){
        this.PassWord = PassWord;
    }
    public String getPassWord(){
        return this.PassWord;
    }
    public void setPhone(String Phone){
        this.Phone = Phone;
    }
    public String getPhone(){
        return this.Phone;
    }
}
