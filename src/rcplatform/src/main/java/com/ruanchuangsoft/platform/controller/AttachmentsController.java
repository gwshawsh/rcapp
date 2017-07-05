package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
import com.ruanchuangsoft.platform.service.AttachmentsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 附件表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-30 15:41:55
 */
@Controller
@RequestMapping("attachments")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class AttachmentsController extends AbstractController {
    @Autowired
    private AttachmentsService attachmentsService;

    @RequestMapping("/attachments")
    public String list() {
        return "attachments/attachments";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/attachments");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("attachments:list")
    public R list(Integer page, Integer limit, String billno) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("billno", billno);
//        if (query != null && query.length() > 0) {
//            try {
//                String tmpquery = query.replaceAll("&quot;", "\"");
//                    AttachmentsEntity param = JSON.parseObject(tmpquery, AttachmentsEntity.class);
//                                    map.put("id", param.getId());
//                                    map.put("billno", param.getBillno());
//                                    map.put("filename", param.getFilename());
//                                    map.put("fileurl", param.getFileurl());
//                                    map.put("makeuser", param.getMakeuser());
//                                    map.put("makedate", param.getMakedate());
//                                    map.put("uptdate", param.getUptdate());
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//
//        }

        //查询列表数据
        List<AttachmentsEntity> attachmentsList = attachmentsService.queryList(map);
        int total = attachmentsService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(attachmentsList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("attachments:info")
    public R info(@PathVariable("id") Long id) {
            AttachmentsEntity attachments = attachmentsService.queryObject(id);

        return R.ok().put("attachments", attachments);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("attachments:save")
    public R save(@RequestBody AttachmentsEntity attachments) {
            attachmentsService.save(attachments);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("attachments:update")
    public R submitworkflow(@RequestBody Long id) {
            AttachmentsEntity attachmentsEntity = attachmentsService.queryObject(id);
        if (attachmentsEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                    


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("attachments:update")
    public R update(@RequestBody AttachmentsEntity attachments) {
            attachmentsService.update(attachments);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("attachments:delete")
    public R delete(@RequestBody Long[]ids) {
            attachmentsService.deleteBatch(ids);

        return R.ok();
    }



}
