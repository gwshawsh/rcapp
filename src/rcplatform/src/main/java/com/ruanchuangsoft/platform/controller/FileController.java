package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
import com.ruanchuangsoft.platform.service.AttachmentsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.activiti.engine.impl.persistence.entity.AttachmentEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("files")
public class FileController {
    @Autowired
    private AttachmentsService attachmentsService;

    @Value("${rcp.fileuploadpath}")
    private String fileuploadpath;

    //文件上传相关代码
    @RequestMapping(value = "upload")
    @ResponseBody
    public R upload(@RequestParam("files") MultipartFile file) {
        if (file.isEmpty()) {
            return R.error("文件为空");
        }
        // 获取文件名
        String fileName = file.getOriginalFilename();
//        logger.info("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
//        logger.info("上传的后缀名为：" + suffixName);
        // 文件上传后的路径
        String filePath = "E://test//";
        // 解决中文问题，liunx下中文路径，图片显示问题
        // fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            return R.ok("上传成功");
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.error("上传是吧");
    }

    //文件下载相关代码
    @RequestMapping("/download")
    public String downloadFile(@RequestParam("file") String fileName, org.apache.catalina.servlet4preview.http.HttpServletRequest request, HttpServletResponse response) {
        if (fileName != null) {
            Map<String, Object> map = new HashMap<>();
            map.put("name", fileName);
            List<AttachmentsEntity> lst = attachmentsService.queryList(map);
            if (lst != null && lst.size() > 0) {
                //当前是从该工程的WEB-INF//File//下获取文件(该目录可以在下面一行代码配置)然后下载到C:\\users\\downloads即本机的默认下载的目录
                String realPath = fileuploadpath + "uploads/";
                File file = new File(realPath, fileName);
                AttachmentsEntity entity=lst.get(0);
                if (file.exists()) {
                    response.setContentType("application/force-download");// 设置强制下载不打开
                    response.addHeader("Content-Disposition",
                            "attachment;fileName=" + entity.getFilename());// 设置文件名
                    byte[] buffer = new byte[1024];
                    FileInputStream fis = null;
                    BufferedInputStream bis = null;
                    try {
                        fis = new FileInputStream(file);
                        bis = new BufferedInputStream(fis);
                        OutputStream os = response.getOutputStream();
                        int i = bis.read(buffer);
                        while (i != -1) {
                            os.write(buffer, 0, i);
                            i = bis.read(buffer);
                        }
                        System.out.println("success");
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (bis != null) {
                            try {
                                bis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        if (fis != null) {
                            try {
                                fis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    //多文件上传
    @RequestMapping(value = "/batchupload", method = RequestMethod.POST)
    @ResponseBody
    public R handleFileUpload(HttpServletRequest request) {
        List<AttachmentsEntity> lstfile = new ArrayList<>();
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("file");
        String realPath = fileuploadpath + "uploads/";
        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdir();
        }


        MultipartFile file = null;
        BufferedOutputStream stream = null;
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();
                    String name = UUID.randomUUID().toString();
                    stream = new BufferedOutputStream(new FileOutputStream(
                            new File(realPath + name)));
                    stream.write(bytes);
                    stream.close();

                    AttachmentsEntity entity = new AttachmentsEntity();
                    entity.setName(name);
                    entity.setFilename(file.getOriginalFilename());
                    entity.setFileurl("/files/download?file=" + name);
                    attachmentsService.save(entity);

                    lstfile.add(entity);


                } catch (Exception e) {
                    stream = null;
                    return R.error("上传失败" + e.getMessage());
                }
            } else {
                return R.error("上传失败");
            }
        }
        PageUtils pageUtil = new PageUtils(lstfile, lstfile.size(), 100, 0);

        return R.ok().put("page", pageUtil);
    }
}
