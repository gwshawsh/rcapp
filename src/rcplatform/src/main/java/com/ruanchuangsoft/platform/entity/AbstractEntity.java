package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;

public class AbstractEntity implements Serializable {
    public BillcommentsEntity billcommentsEntity;

    public BillcommentsEntity getBillcommentsEntity() {
        return billcommentsEntity;
    }

    public void setBillcommentsEntity(BillcommentsEntity billcommentsEntity) {
        this.billcommentsEntity = billcommentsEntity;
    }
}
