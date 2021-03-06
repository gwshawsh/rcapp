package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
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

import com.ruanchuangsoft.platform.entity.TransteamEntity;
import com.ruanchuangsoft.platform.service.TransteamService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 车队管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:20
 */
@Controller
@RequestMapping("transteam")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class TransteamController extends AbstractController {
    @Autowired
    private TransteamService transteamService;

    @RequestMapping("/transteam")
    public String list() {
        return "transteam/transteam";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/transteam");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("transteam:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    TransteamEntity param = JSON.parseObject(tmpquery, TransteamEntity.class);
                                    map.put("id", param.getId());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("address", param.getAddress());
                                    map.put("contact", param.getContact());
                                    map.put("contactNumber", param.getContactNumber());
                                    map.put("vehicleType", param.getVehicleType());
                                    map.put("billingInformation", param.getBillingInformation());
                                    map.put("accountInformation", param.getAccountInformation());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<TransteamEntity> transteamList = transteamService.queryList(map);
        int total = transteamService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(transteamList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("transteam:info")
    public R info(@PathVariable("id") Long id) {
            TransteamEntity transteam = transteamService.queryObject(id);

        return R.ok().put("transteam", transteam);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("transteam:save")
    public R save(@RequestBody TransteamEntity transteam) {
                      transteamService.save(transteam);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("transteam:update")
    public R submitworkflow(@RequestBody Long id) {
            TransteamEntity transteamEntity = transteamService.queryObject(id);
        if (transteamEntity == null) {
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
    @RequiresPermissions("transteam:update")
    public R update(@RequestBody TransteamEntity transteam) {
            transteamService.update(transteam);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("transteam:delete")
    public R delete(@RequestBody Long[]ids) {
            transteamService.deleteBatch(ids);

        return R.ok();
    }



}
