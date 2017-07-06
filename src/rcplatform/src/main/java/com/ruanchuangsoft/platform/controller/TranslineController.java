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

import com.ruanchuangsoft.platform.entity.TranslineEntity;
import com.ruanchuangsoft.platform.service.TranslineService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 线路管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:20
 */
@Controller
@RequestMapping("transline")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class TranslineController extends AbstractController {
    @Autowired
    private TranslineService translineService;

    @RequestMapping("/transline")
    public String list() {
        return "transline/transline";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/transline");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("transline:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    TranslineEntity param = JSON.parseObject(tmpquery, TranslineEntity.class);
                                    map.put("id", param.getId());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("startlocation", param.getStartlocation());
                                    map.put("endlocation", param.getEndlocation());
                                    map.put("distance", param.getDistance());
                                    map.put("helpcode", param.getHelpcode());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<TranslineEntity> translineList = translineService.queryList(map);
        int total = translineService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(translineList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("transline:info")
    public R info(@PathVariable("id") Long id) {
            TranslineEntity transline = translineService.queryObject(id);

        return R.ok().put("transline", transline);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("transline:save")
    public R save(@RequestBody TranslineEntity transline) {
                      translineService.save(transline);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("transline:update")
    public R submitworkflow(@RequestBody Long id) {
            TranslineEntity translineEntity = translineService.queryObject(id);
        if (translineEntity == null) {
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
    @RequiresPermissions("transline:update")
    public R update(@RequestBody TranslineEntity transline) {
            translineService.update(transline);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("transline:delete")
    public R delete(@RequestBody Long[]ids) {
            translineService.deleteBatch(ids);

        return R.ok();
    }



}
