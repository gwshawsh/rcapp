package com.ruanchuangsoft.platform.utils.generator;

import com.ruanchuangsoft.platform.utils.DateUtils;
import com.ruanchuangsoft.platform.utils.RRException;
import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成器   工具类
 */
public class GenUtils {

    public static List<String> getSqlTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/gencode/db.sql.vm");
        return templates;
    }


    public static List<String> getTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/gencode/Entity.java.vm");
        templates.add("templates/gencode/Dao.java.vm");
        templates.add("templates/gencode/Dao.xml.vm");
        templates.add("templates/gencode/Service.java.vm");
        templates.add("templates/gencode/ServiceImpl.java.vm");
        templates.add("templates/gencode/Controller.java.vm");
        templates.add("templates/gencode/list.html.vm");
        templates.add("templates/gencode/list.js.vm");
        templates.add("templates/gencode/ref.html.vm");
        templates.add("templates/gencode/db.sql.vm");
        return templates;
    }

    public static List<String> getBillTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/gencode/EntityMain.java.vm");
        templates.add("templates/gencode/DaoMain.java.vm");
        templates.add("templates/gencode/DaoMain.xml.vm");
        templates.add("templates/gencode/ServiceMain.java.vm");
        templates.add("templates/gencode/ServiceImplMain.java.vm");
        templates.add("templates/gencode/ControllerMain.java.vm");
        templates.add("templates/gencode/listmain.html.vm");
        templates.add("templates/gencode/listmain.js.vm");
        templates.add("templates/gencode/ref.html.vm");
        templates.add("templates/gencode/db.sql.vm");
        return templates;
    }

    public static List<String> getBillDetailTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/gencode/Entity.java.vm");
        templates.add("templates/gencode/DaoDetail.java.vm");
        templates.add("templates/gencode/DaoDetail.xml.vm");
        templates.add("templates/gencode/Service.java.vm");
        templates.add("templates/gencode/ServiceImpl.java.vm");
        templates.add("templates/gencode/Controller.java.vm");
        templates.add("templates/gencode/list.html.vm");
        templates.add("templates/gencode/list.js.vm");
        return templates;
    }

    public static List<String> getTreeTemplates() {
        List<String> templates = new ArrayList<String>();
        templates.add("templates/gencode/TreeEntity.java.vm");
        templates.add("templates/gencode/Dao.java.vm");
        templates.add("templates/gencode/TreeDao.xml.vm");
        templates.add("templates/gencode/Service.java.vm");
        templates.add("templates/gencode/ServiceImpl.java.vm");
        templates.add("templates/gencode/TreeController.java.vm");
        templates.add("templates/gencode/treelist.html.vm");
        templates.add("templates/gencode/treelist.js.vm");
        templates.add("templates/gencode/db.sql.vm");
        return templates;
    }


    /**
     * 生成代码
     * gentype:0 单表 1-树型表 2-主从表
     */
    public static void generatorCode(Map<String, String> table,
                                     List<Map<String, String>> columns, String parentPath,ZipOutputStream zip, int gentype) {
        //配置信息
        Configuration config = getConfig();


        //表信息
        TableEntity tableEntity = new TableEntity();
        tableEntity.setTableName(table.get("tableName"));
        tableEntity.setComments(table.get("tableComment"));
        //表名转换成Java类名
        String className = tableToJava(tableEntity.getTableName(), config.getString("tablePrefix"));
        tableEntity.setClassName(className);
        tableEntity.setClassname(StringUtils.uncapitalize(className));

        //列信息
        List<ColumnEntity> columsList = new ArrayList<>();
        for (Map<String, String> column : columns) {
            ColumnEntity columnEntity = new ColumnEntity();
            columnEntity.setColumnName(column.get("columnName"));
            columnEntity.setDataType(column.get("dataType"));
            columnEntity.setComments(column.get("columnComment"));
            columnEntity.setExtra(column.get("extra"));

            //列名转换成Java属性名
            String attrName = columnToJava(columnEntity.getColumnName());
            columnEntity.setAttrName(attrName);
            columnEntity.setAttrname(StringUtils.uncapitalize(attrName));

            //列的数据类型，转换成Java类型
            String attrType = config.getString(columnEntity.getDataType(), "unknowType");
            columnEntity.setAttrType(attrType);

            //是否主键
            if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableEntity.getPk() != null) {
                tableEntity.setPk(columnEntity);
            }

            columsList.add(columnEntity);
        }
        tableEntity.setColumns(columsList);

        //没主键，则第一个字段为主键
        if (tableEntity.getPk() == null) {
            tableEntity.setPk(tableEntity.getColumns().get(0));
        }

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);

        //封装模板数据
        Map<String, Object> map = new HashMap<>();
        map.put("parent", parentPath);
        map.put("tableName", tableEntity.getTableName());
        map.put("comments", tableEntity.getComments());
        map.put("pk", tableEntity.getPk());
        map.put("className", tableEntity.getClassName());
        map.put("classname", tableEntity.getClassname());
        map.put("pathName", tableEntity.getClassname().toLowerCase());
        map.put("columns", tableEntity.getColumns());
        map.put("refcolumns", tableEntity.getRefColumns());
        map.put("package", config.getString("package"));
        map.put("author", config.getString("author"));
        map.put("email", config.getString("email"));
        map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
        VelocityContext context = new VelocityContext(map);
        //获取模板列表
        List<String> templates;
        if (gentype == 0) {
            templates = getTemplates();
        } else if (gentype == 1) {
            templates = getTreeTemplates();
        } else {
            templates = getTemplates();
        }
        for (String template : templates) {
            //渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, "UTF-8");
            tpl.merge(context, sw);


            try {
                //添加到zip
                zip.putNextEntry(new ZipEntry(getFileName(template, tableEntity.getClassName(), config.getString("package"))));
                IOUtils.write(sw.toString(), zip, "UTF-8");
                IOUtils.closeQuietly(sw);
                zip.closeEntry();
            } catch (IOException e) {
                throw new RRException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
            }
        }
    }

    public static TableEntity setTableEntityColumn(Map<String, String> table, List<Map<String, String>> columns) {
        Configuration config = getConfig();


        //表信息
        TableEntity tableEntity = new TableEntity();
        tableEntity.setTableName(table.get("tableName"));
        tableEntity.setComments(table.get("tableComment"));
        //表名转换成Java类名
        String className = tableToJava(tableEntity.getTableName(), config.getString("tablePrefix"));
        tableEntity.setClassName(className);
        tableEntity.setClassname(StringUtils.uncapitalize(className));

        //列信息
        List<ColumnEntity> columsList = new ArrayList<>();
        for (Map<String, String> column : columns) {
            ColumnEntity columnEntity = new ColumnEntity();
            columnEntity.setColumnName(column.get("columnName"));
            columnEntity.setDataType(column.get("dataType"));
            columnEntity.setComments(column.get("columnComment"));
            columnEntity.setExtra(column.get("extra"));

            //列名转换成Java属性名
            String attrName = columnToJava(columnEntity.getColumnName());
            columnEntity.setAttrName(attrName);
            columnEntity.setAttrname(StringUtils.uncapitalize(attrName));

            //列的数据类型，转换成Java类型
            String attrType = config.getString(columnEntity.getDataType(), "unknowType");
            columnEntity.setAttrType(attrType);

            //是否主键
            if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableEntity.getPk() != null) {
                tableEntity.setPk(columnEntity);
            }

            columsList.add(columnEntity);
        }
        tableEntity.setColumns(columsList);

        //没主键，则第一个字段为主键
        if (tableEntity.getPk() == null) {
            tableEntity.setPk(tableEntity.getColumns().get(0));
        }


        return tableEntity;
    }

    /**
     * 生成代码
     */
    public static void generatorBillCode(Map<String, String> table,
                                         List<Map<String, String>> columns,
                                         Map<String, String> table2,
                                         List<Map<String, String>> columns2,
                                         String parentPath,
                                         ZipOutputStream zip) {
        //配置信息
        Configuration config = getConfig();


        //表信息
        TableEntity tableEntity = setTableEntityColumn(table, columns);
        //明细表信息
        TableEntity tableEntity2 = setTableEntityColumn(table2, columns2);

        tableEntity.setDetails(tableEntity2);

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);

        //封装主表模板数据
        Map<String, Object> map = new HashMap<>();
        map.put("parent",parentPath);
        map.put("tableName", tableEntity.getTableName());
        map.put("comments", tableEntity.getComments());
        map.put("pk", tableEntity.getPk());
        map.put("className", tableEntity.getClassName());
        map.put("classname", tableEntity.getClassname());
        map.put("pathName", tableEntity.getClassname().toLowerCase());
        map.put("columns", tableEntity.getColumns());
        map.put("refcolumns", tableEntity.getRefColumns());
        map.put("details", tableEntity2.getClassName());
        map.put("detailClassName", tableEntity2.getClassName());
        map.put("detailclassname", tableEntity2.getClassname());
        map.put("detailcolumns", tableEntity2.getColumns());
        map.put("detailrefcolumns", tableEntity2.getRefColumns());
        map.put("package", config.getString("package"));
        map.put("author", config.getString("author"));
        map.put("email", config.getString("email"));
        map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
        VelocityContext context = new VelocityContext(map);
        //获取模板列表
        List<String> templates;


        templates = getBillTemplates();

        for (String template : templates) {
            //渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, "UTF-8");
            tpl.merge(context, sw);

            try {
                //添加到zip
                zip.putNextEntry(new ZipEntry(getFileName(template, tableEntity.getClassName(), config.getString("package"))));
                IOUtils.write(sw.toString(), zip, "UTF-8");
                IOUtils.closeQuietly(sw);
                zip.closeEntry();
            } catch (IOException e) {
                throw new RRException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
            }
        }


        //封装明细表模板数据
        Map<String, Object> map2 = new HashMap<>();
        map2.put("parent",parentPath);
        map2.put("tableName", tableEntity2.getTableName());
        map2.put("comments", tableEntity2.getComments());
        map2.put("pk", tableEntity2.getPk());
        map2.put("className", tableEntity2.getClassName());
        map2.put("classname", tableEntity2.getClassname());
        map2.put("pathName", tableEntity2.getClassname().toLowerCase());
        map2.put("columns", tableEntity2.getColumns());
        map2.put("package", config.getString("package"));
        map2.put("author", config.getString("author"));
        map2.put("email", config.getString("email"));
        map2.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
        VelocityContext context2 = new VelocityContext(map2);
        //获取模板列表
        List<String> templates2 = getBillDetailTemplates();



        for (String template : templates2) {
            //渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, "UTF-8");
            tpl.merge(context2, sw);


            try {
                String outfilepath=getFileName(template, tableEntity2.getClassName(), config.getString("package"));
                //添加到zip
                zip.putNextEntry(new ZipEntry(outfilepath));
                IOUtils.write(sw.toString(), zip, "UTF-8");
                IOUtils.closeQuietly(sw);
                zip.closeEntry();
            } catch (IOException e) {
                throw new RRException("渲染模板失败，表名：" + tableEntity2.getTableName(), e);
            }
        }


    }


    /**
     * 生成代码
     * gentype:0 单表 1-树型表 2-主从表
     */
    public static  void generatorSqlCode(Map<String, String> table,
                                        List<Map<String, String>> columns, String parentPath, ZipOutputStream zip) {
        //配置信息
        Configuration config = getConfig();


        //表信息
        TableEntity tableEntity = new TableEntity();
        tableEntity.setTableName(table.get("tableName"));
        tableEntity.setComments(table.get("tableComment"));
        //表名转换成Java类名
        String className = tableToJava(tableEntity.getTableName(), config.getString("tablePrefix"));
        tableEntity.setClassName(className);
        tableEntity.setClassname(StringUtils.uncapitalize(className));

        //列信息
        List<ColumnEntity> columsList = new ArrayList<>();
        for (Map<String, String> column : columns) {
            ColumnEntity columnEntity = new ColumnEntity();
            columnEntity.setColumnName(column.get("columnName"));
            columnEntity.setDataType(column.get("dataType"));
            columnEntity.setComments(column.get("columnComment"));
            columnEntity.setExtra(column.get("extra"));

            //列名转换成Java属性名
            String attrName = columnToJava(columnEntity.getColumnName());
            columnEntity.setAttrName(attrName);
            columnEntity.setAttrname(StringUtils.uncapitalize(attrName));

            //列的数据类型，转换成Java类型
            String attrType = config.getString(columnEntity.getDataType(), "unknowType");
            columnEntity.setAttrType(attrType);

            //是否主键
            if ("PRI".equalsIgnoreCase(column.get("columnKey")) && tableEntity.getPk() != null) {
                tableEntity.setPk(columnEntity);
            }

            columsList.add(columnEntity);
        }
        tableEntity.setColumns(columsList);

        //没主键，则第一个字段为主键
        if (tableEntity.getPk() == null) {
            tableEntity.setPk(tableEntity.getColumns().get(0));
        }

        //设置velocity资源加载器
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);

        //封装模板数据
        Map<String, Object> map = new HashMap<>();
        map.put("parent",parentPath);
        map.put("tableName", tableEntity.getTableName());
        map.put("comments", tableEntity.getComments());
        map.put("pk", tableEntity.getPk());
        map.put("className", tableEntity.getClassName());
        map.put("classname", tableEntity.getClassname());
        map.put("pathName", tableEntity.getClassname().toLowerCase());
        map.put("columns", tableEntity.getColumns());
        map.put("refcolumns", tableEntity.getRefColumns());
        map.put("package", config.getString("package"));
        map.put("author", config.getString("author"));
        map.put("email", config.getString("email"));
        map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
        VelocityContext context = new VelocityContext(map);
        //获取模板列表
        List<String> templates;

        templates = getSqlTemplates();

        try {

        for (String template : templates) {
            //渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, "UTF-8");
            tpl.merge(context, sw);

                //添加到zip


                IOUtils.write(sw.toString(), zip, "UTF-8");
                IOUtils.closeQuietly(sw);



        }
        } catch (IOException e) {
            throw new RRException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
        }
    }


    /**
     * 列名转换成Java属性名
     */
    public static String columnToJava(String columnName) {
        return WordUtils.capitalizeFully(columnName, new char[]{'_'}).replace("_", "");
    }

    /**
     * 表名转换成Java类名
     */
    public static String tableToJava(String tableName, String tablePrefix) {
        if (StringUtils.isNotBlank(tablePrefix)) {
            tableName = tableName.replace(tablePrefix, "");
        }
        return columnToJava(tableName);
    }

    /**
     * 获取配置信息
     */
    public static Configuration getConfig() {
        try {
            return new PropertiesConfiguration("generator.properties");
        } catch (ConfigurationException e) {
            throw new RRException("获取配置文件失败，", e);
        }
    }

    /**
     * 获取文件名
     */
    public static String getFileName(String template, String className, String packageName) {
        String packagePath = "";
        if (StringUtils.isNotBlank(packageName)) {
            packagePath = packageName.replace(".", File.separator) + File.separator;
        }

        if (template.contains("Entity.java.vm") || template.contains("EntityMain.java.vm")) {
            return packagePath + "entity" + File.separator + className + "Entity.java";
        }

        if (template.contains("Dao.java.vm") || template.contains("DaoMain.java.vm")
                || template.contains("DaoDetail.java.vm")) {
            return packagePath + "dao" + File.separator + className + "Dao.java";
        }

        if (template.contains("Dao.xml.vm")
                || template.contains("DaoMain.xml.vm")
                || template.contains("DaoDetail.xml.vm")) {
            return packagePath + "dao" + File.separator + className + "Dao.xml";
        }

        if (template.contains("Service.java.vm") || template.contains("ServiceMain.java.vm")) {
            return packagePath + "service" + File.separator + className + "Service.java";
        }

        if (template.contains("ServiceImpl.java.vm") || template.contains("ServiceImplMain.java.vm")) {
            return packagePath + "service" + File.separator + "impl" + File.separator + className + "ServiceImpl.java";
        }

        if (template.contains("Controller.java.vm") || template.contains("ControllerMain.java.vm")) {
            return packagePath + "controller" + File.separator + className + "Controller.java";
        }

        if (template.contains("list.html.vm")) {
            return "html" + File.separator + className.toLowerCase() + ".html";
        }

        if (template.contains("listmain.html.vm")) {
            return "html" + File.separator + className.toLowerCase() + ".html";
        }

        if (template.contains("ref.html.vm")) {
            return "html" + File.separator + className.toLowerCase() + "_ref.html";
        }

        if (template.contains("list.js.vm") || template.contains("listmain.js.vm")) {
            return "js" + File.separator + className.toLowerCase() + ".js";
        }

        if (template.contains("db.sql.vm")) {
            return packagePath + "dao" + File.separator + className + ".sql";
        }

        return null;
    }
}
