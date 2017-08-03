package com.ruanchuangsoft.platform.enums;

/**
 * Created by lidongfeng on 2017/5/31.
 */
public interface TakeboxBillStatus {
    int NEW=0;
    int TAKEBOX=1;
    int TAKEBOXERROR=2;
    int TAKEBOXEND=3;
    int CHANGING=4;
    int CHANGEEND=5;
    int AUDIT=6;
    int STARTTRANS=7;//

    int ENDTRANS=8;//
    int DELETE=9;

}
