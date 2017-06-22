package com.ruanchuangsoft.platform.service;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月19日 下午3:33:38
 */
public interface SysGeneratorService {
	
	List<Map<String, Object>> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	Map<String, String> queryTable(String tableName);
	
	List<Map<String, String>> queryColumns(String tableName);
	
	/**
	 * 生成代码
	 */
	byte[] generatorCode(String[] tableNames,String path);
	byte[] generatorBillCode(String[] tableNames,String path);
	byte[] generatorTreeCode(String[] tableNames,String path);
	byte[] generatorSqlCode(String[] tableNames,String path);
}
