package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.SysGeneratorDao;
import com.ruanchuangsoft.platform.service.SysGeneratorService;
import com.ruanchuangsoft.platform.utils.generator.GenUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class SysGeneratorServiceImpl implements SysGeneratorService {
    @Autowired
    private SysGeneratorDao sysGeneratorDao;

    @Override
    public List<Map<String, Object>> queryList(Map<String, Object> map) {
        return sysGeneratorDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysGeneratorDao.queryTotal(map);
    }

    @Override
    public Map<String, String> queryTable(String tableName) {
        return sysGeneratorDao.queryTable(tableName);
    }

    @Override
    public List<Map<String, String>> queryColumns(String tableName) {
        return sysGeneratorDao.queryColumns(tableName);
    }

    @Override
    public byte[] generatorCode(String[] tableNames,String path) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);

        for (String tableName : tableNames) {
            //查询表信息
            Map<String, String> table = queryTable(tableName);
            //查询列信息
            List<Map<String, String>> columns = queryColumns(tableName);
            //生成代码
            GenUtils.generatorCode(table, columns,path, zip, 0);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    @Override
    public byte[] generatorSqlCode(String[] tableNames,String path) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);

        List<String> lstFilePath=new ArrayList<>();
        String filepath="db.sql";
        try {
            zip.putNextEntry(new ZipEntry(filepath));

            for (String tableName : tableNames) {
                //查询表信息
                Map<String, String> table = queryTable(tableName);
                //查询列信息
                List<Map<String, String>> columns = queryColumns(tableName);
                //生成代码
                GenUtils.generatorSqlCode(table, columns, path, zip);

            }

            IOUtils.closeQuietly(zip);

        }
        catch (Exception e){

        }
        return outputStream.toByteArray();
    }


    @Override
    public byte[] generatorBillCode(String[] tableNames,String path) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        String tableName;
        String tableName2;
        if (tableNames[0].contains("main")) {
            tableName = tableNames[0];
            tableName2 = tableNames[1];
        } else {
            tableName = tableNames[1];
            tableName2 = tableNames[0];
        }


        //查询表信息
        Map<String, String> table = queryTable(tableName);
        //查询列信息
        List<Map<String, String>> columns = queryColumns(tableName);

        //查询表信息
        Map<String, String> table2 = queryTable(tableName2);
        //查询列信息
        List<Map<String, String>> columns2 = queryColumns(tableName2);

        //生成代码
        GenUtils.generatorBillCode(table, columns, table2, columns2,path, zip);

        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    @Override
    public byte[] generatorTreeCode(String[] tableNames,String path) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);

        for (String tableName : tableNames) {
            //查询表信息
            Map<String, String> table = queryTable(tableName);
            //查询列信息
            List<Map<String, String>> columns = queryColumns(tableName);
            //生成代码
            GenUtils.generatorCode(table, columns,path, zip, 1);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

}
