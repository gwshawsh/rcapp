package com.ruanchuangsoft.platform.enums;

public interface BillStatus {
    int NEW=0;//新增
    int SUBMIT=1;//已提交
    int CLAIM=2;//已签收
    int AUDITING =3;//审核中
    int COMPLETE=4;//已完成
    int REJECT = 5;//驳回
    int REAPPLY = 6;//重新申请
    int CANCLE=9;//作废
}
