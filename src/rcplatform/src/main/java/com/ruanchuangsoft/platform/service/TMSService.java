package com.ruanchuangsoft.platform.service;

/**
 * Created by lidongfeng on 2017/7/18.
 */
public interface TMSService {
    //集卡委托
    boolean sendOrderTruck(Long id);

    //路线  方法:Line
    boolean sendLine(Long id);


    boolean sendUnit(Long id);

    boolean sendFeeitem(Long id);

    boolean sendCurrency(Long id);

    boolean sendBank(Long id);

    boolean sendOperator(Long id);

}
