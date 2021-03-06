package com.ruanchuangsoft.platform.utils.generator;

import java.util.ArrayList;
import java.util.List;

/**
 * 表数据
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月20日 上午12:02:55
 */
public class TableEntity {
    //表的名称
    private String tableName;
    //表的备注
    private String comments;
    //表的主键
    private ColumnEntity pk;
    //表的列名(不包含主键)
    private List<ColumnEntity> columns;

    //表的参照列,去掉重复的参照
    private List<ColumnEntity> refColumns;

    public boolean containsRefColumn(ColumnEntity pcol) {
        for (ColumnEntity item : refColumns) {
            if (item.getRefTable().equalsIgnoreCase(pcol.getRefTable())
                    && item.getRefType().equalsIgnoreCase(pcol.getRefType())) {
                return true;
            }
        }
        return false;
    }

    public List<ColumnEntity> getRefColumns() {
        if (refColumns == null) {
            refColumns = new ArrayList<>();
            for (ColumnEntity item :
                    columns) {
                if (item.isRefColumn() && !containsRefColumn(item)) {
                    refColumns.add(item);
                }
            }
        }
        return refColumns;
    }

    public void setRefColumns(List<ColumnEntity> refColumns) {

        this.refColumns = refColumns;
    }


    //类名(第一个字母大写)，如：sys_user => SysUser
    private String className;
    //类名(第一个字母小写)，如：sys_user => sysUser
    private String classname;

    private TableEntity details;

    public TableEntity getDetails() {
        return details;
    }

    public void setDetails(TableEntity details) {
        this.details = details;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public ColumnEntity getPk() {
        return pk;
    }

    public void setPk(ColumnEntity pk) {
        this.pk = pk;
    }

    public List<ColumnEntity> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnEntity> columns) {
        this.columns = columns;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }


}
