package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.List;

/**
 * The type Abstract entity.
 * 所有的实体类窦继承自这个类，具备审核备注列表，附件列表
 */
public class AbstractEntity implements Serializable {
    public BillcommentsEntity billcommentsEntity;

    public BillcommentsEntity getBillcommentsEntity() {
        return billcommentsEntity;
    }

    public void setBillcommentsEntity(BillcommentsEntity billcommentsEntity) {
        this.billcommentsEntity = billcommentsEntity;
    }

    public List<AttachmentsEntity> files;

    public List<AttachmentsEntity> getFiles() {
        return files;
    }

    public void setFiles(List<AttachmentsEntity> files) {
        this.files = files;
    }
}
