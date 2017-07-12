package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
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

import com.ruanchuangsoft.platform.entity.FeeinfoEntity;
import com.ruanchuangsoft.platform.service.FeeinfoService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 费用项目
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-07 13:38:29
 */
@Controller
@RequestMapping("feeinfo")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class FeeinfoController extends AbstractController {
    @Autowired
    private FeeinfoService feeinfoService;

    @RequestMapping("/feeinfo")
    public String list() {
        return "feeinfo/feeinfo";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/feeinfo");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("feeinfo:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    FeeinfoEntity param = JSON.parseObject(tmpquery, FeeinfoEntity.class);
                                    map.put("id", param.getId());
                                    map.put("parentId", param.getParentId());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("feetype", param.getFeetype());
                                    map.put("paytype", param.getPaytype());
                                    map.put("lineid", param.getLineid());
                                    map.put("boxtype", param.getBoxtype());
                                    map.put("price", param.getPrice());
                                    map.put("cost", param.getCost());
                                    map.put("remark", param.getRemark());
                                    map.put("status", param.getStatus());
                                    map.put("nodetype", param.getNodetype());
                                    map.put("uptdate", param.getUptdate());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<FeeinfoEntity> feeinfoList = feeinfoService.queryList(map);
        int total = feeinfoService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(feeinfoList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("feeinfo:info")
    public R info(@PathVariable("id") Long id) {
            FeeinfoEntity feeinfo = feeinfoService.queryObject(id);

        return R.ok().put("feeinfo", feeinfo);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("feeinfo:save")
    public R save(@RequestBody FeeinfoEntity feeinfo) {
                      feeinfoService.save(feeinfo);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("feeinfo:update")
    public R submitworkflow(@RequestBody Long id) {
            FeeinfoEntity feeinfoEntity = feeinfoService.queryObject(id);
        if (feeinfoEntity == null) {
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
    @RequiresPermissions("feeinfo:update")
    public R update(@RequestBody FeeinfoEntity feeinfo) {
            feeinfoService.update(feeinfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("feeinfo:delete")
    public R delete(@RequestBody Long[]ids) {
            feeinfoService.deleteBatch(ids);

        return R.ok();
    }


   
}
