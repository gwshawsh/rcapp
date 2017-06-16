package com.ruanchuangsoft.platform.utils.generator;

/**
 * 列的属性
 *
 * @author chenshun
 * @email sunlightcs @gmail.com
 * @date 2016年12月20日 上午12:01:45
 */
public class ColumnEntity {
	//列名
    private String columnName;
    //列名类型
    private String dataType;
    //列名备注
    private String comments;
    
    //属性名称(第一个字母大写)，如：user_name => UserName
    private String attrName;
    //属性名称(第一个字母小写)，如：user_name => userName
    private String attrname;
    //属性类型
    private String attrType;
    //auto_increment
    private String extra;
    
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getComments() {
		if(comments.contains(":")){
			String[] tmp=comments.split(":");
			if(tmp.length>0){
				return tmp[0];
			}
			else{
				return comments;
			}
		}
		else {
			return comments;
		}
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getAttrname() {
		return attrname;
	}
	public void setAttrname(String attrname) {
		this.attrname = attrname;
	}
	public String getAttrName() {
		return attrName;
	}
	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	public String getAttrType() {
		return attrType;
	}
	public void setAttrType(String attrType) {
		this.attrType = attrType;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}

	//判断是否是参照其他表的列,判断依据是comments是要包含冒号,并且是固定的格式:
	//部门:表名:参照列id:参照列显示列名称
	public boolean refColumn;

	public void setRefColumn(boolean refColumn) {
		this.refColumn = refColumn;
	}

	public boolean isRefColumn(){
		if(comments.contains(":")){
			return true;
		}
		else{
			return false;
		}
	}


	private String refTable;
	private String refType;//参照的方式:dialog表参照采用弹出框 combo:下拉参照  combotree:下拉树形参照  radio:单选参照
	private String refColumnId;
	private String refColumnName;


	/**
	 * 返回参照的表名
	 *
	 * @return the ref table
	 */
	public String getRefTable() {

		if(comments.contains(":")){
			String[] tmp=comments.split(":");
			if(tmp.length>0){
				refTable=tmp[2];
				return refTable;
			}
			else{
				return "";
			}
		}
		else {
			return "";
		}
	}

	/**
	 * 返回参照窗体样式:dialog  combo  combotree radio
	 *
	 * @return the ref type
	 */
	public String getRefType() {
		if(comments.contains(":")){
			String[] tmp=comments.split(":");
			if(tmp.length>0){
				refType=tmp[1];
				return refType;
			}
			else{
				return "";
			}
		}
		else {
			return "";
		}

	}

	public void setRefType(String refType) {
		this.refType = refType;
	}

	public void setRefTable(String refTable) {
		this.refTable = refTable;
	}


	/**
	 * 返回参照列id名称.
	 *
	 * @return the ref column id
	 */
	public String getRefColumnId() {
		if(comments.contains(":")){
			String[] tmp=comments.split(":");
			if(tmp.length>0){
				refColumnId=tmp[3];
				return refColumnId;
			}
			else{
				return "";
			}
		}
		else {
			return "";
		}
	}

	public void setRefColumnId(String refColumnId) {
		this.refColumnId = refColumnId;
	}

	/**
	 * 返回参照列名称.
	 *
	 * @return the ref column name
	 */
	public String getRefColumnName() {
		if(comments.contains(":")){
			String[] tmp=comments.split(":");
			if(tmp.length>0){
				refColumnName=tmp[4];
				return refColumnName;
			}
			else{
				return "";
			}
		}
		else {
			return "";
		}
	}

	public void setRefColumnName(String refColumnName) {
		this.refColumnName = refColumnName;
	}
}
