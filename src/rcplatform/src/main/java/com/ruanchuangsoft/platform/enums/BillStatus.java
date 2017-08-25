package com.ruanchuangsoft.platform.enums;

public interface BillStatus {
    int NEW=0;//新增
    int SUBMIT=1;//已提交
    int CLAIM=2;//已签收
    int AUDIT=3;//审核中
    int COMPLETE=4;//已完成

    int CANCLE=9;//作废
}
