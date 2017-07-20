package com.ruanchuangsoft.platform.entity.tms;

import java.util.List;

/**
 * Created by lidongfeng on 2017/7/18.
 */
public class OrderTruck {
    private String TruckType;

    private String SStation;

    private String ESTation;

    private String CustomerCode;

    private String Unit;

    private String Link;

    private String LinkTel;

    private String FactoryName;

    private String FactoryAddress;

    private String FactoryTel;

    private String FactoryLink;

    private String FactoryLinkTel;

    private String JGDate;

    private String Vessel;

    private String BillNumber;

    private String DaoDaDate;

    private String Pname;

    private String AddDate;

    public String getTruckType() {
        return TruckType;
    }

    public void setTruckType(String truckType) {
        TruckType = truckType;
    }

    public String getSStation() {
        return SStation;
    }

    public void setSStation(String SStation) {
        this.SStation = SStation;
    }

    public String getESTation() {
        return ESTation;
    }

    public void setESTation(String ESTation) {
        this.ESTation = ESTation;
    }

    public String getCustomerCode() {
        return CustomerCode;
    }

    public void setCustomerCode(String customerCode) {
        CustomerCode = customerCode;
    }

    public String getUnit() {
        return Unit;
    }

    public void setUnit(String unit) {
        Unit = unit;
    }

    public String getLink() {
        return Link;
    }

    public void setLink(String link) {
        Link = link;
    }

    public String getLinkTel() {
        return LinkTel;
    }

    public void setLinkTel(String linkTel) {
        LinkTel = linkTel;
    }

    public String getFactoryName() {
        return FactoryName;
    }

    public void setFactoryName(String factoryName) {
        FactoryName = factoryName;
    }

    public String getFactoryAddress() {
        return FactoryAddress;
    }

    public void setFactoryAddress(String factoryAddress) {
        FactoryAddress = factoryAddress;
    }

    public String getFactoryTel() {
        return FactoryTel;
    }

    public void setFactoryTel(String factoryTel) {
        FactoryTel = factoryTel;
    }

    public String getFactoryLink() {
        return FactoryLink;
    }

    public void setFactoryLink(String factoryLink) {
        FactoryLink = factoryLink;
    }

    public String getFactoryLinkTel() {
        return FactoryLinkTel;
    }

    public void setFactoryLinkTel(String factoryLinkTel) {
        FactoryLinkTel = factoryLinkTel;
    }

    public String getJGDate() {
        return JGDate;
    }

    public void setJGDate(String JGDate) {
        this.JGDate = JGDate;
    }

    public String getVessel() {
        return Vessel;
    }

    public void setVessel(String vessel) {
        Vessel = vessel;
    }

    public String getBillNumber() {
        return BillNumber;
    }

    public void setBillNumber(String billNumber) {
        BillNumber = billNumber;
    }

    public String getDaoDaDate() {
        return DaoDaDate;
    }

    public void setDaoDaDate(String daoDaDate) {
        DaoDaDate = daoDaDate;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public String getAddDate() {
        return AddDate;
    }

    public void setAddDate(String addDate) {
        AddDate = addDate;
    }

    public List<Subbox> getSub() {
        return Sub;
    }

    public void setSub(List<Subbox> sub) {
        Sub = sub;
    }

    private List<Subbox> Sub ;
}
