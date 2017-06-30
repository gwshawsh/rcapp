package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

public class CommentsEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //编码
    private String billno;
    //审批结果
    private String auditresult;
    //更新时间
    private Date uptdate;
    //备注
    private String remark;
}
