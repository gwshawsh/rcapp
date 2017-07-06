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

import com.ruanchuangsoft.platform.entity.ShipplanEntity;
import com.ruanchuangsoft.platform.service.ShipplanService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 船舶计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:20
 */
@Controller
@RequestMapping("shipplan")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class ShipplanController extends AbstractController {
    @Autowired
    private ShipplanService shipplanService;

    @RequestMapping("/shipplan")
    public String list() {
        return "shipplan/shipplan";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/shipplan");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("shipplan:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    ShipplanEntity param = JSON.parseObject(tmpquery, ShipplanEntity.class);
                                    map.put("id", param.getId());
                                    map.put("enshipname", param.getEnshipname());
                                    map.put("chshipname", param.getChshipname());
                                    map.put("expvoyage", param.getExpvoyage());
                                    map.put("impvoyage", param.getImpvoyage());
                                    map.put("arrivalstate", param.getArrivalstate());
                                    map.put("arrivaldate", param.getArrivaldate());
                                    map.put("shipid", param.getShipid());
                                    map.put("imono", param.getImono());
                                    map.put("dockcode", param.getDockcode());
                                    map.put("dockname", param.getDockname());
                                    map.put("dockunit", param.getDockunit());
                                    map.put("route", param.getRoute());
                                    map.put("arrivaltime", param.getArrivaltime());
                                    map.put("leavetime", param.getLeavetime());
                                    map.put("shipment", param.getShipment());
                                    map.put("remark", param.getRemark());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<ShipplanEntity> shipplanList = shipplanService.queryList(map);
        int total = shipplanService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(shipplanList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("shipplan:info")
    public R info(@PathVariable("id") Long id) {
            ShipplanEntity shipplan = shipplanService.queryObject(id);

        return R.ok().put("shipplan", shipplan);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("shipplan:save")
    public R save(@RequestBody ShipplanEntity shipplan) {
                      shipplanService.save(shipplan);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("shipplan:update")
    public R submitworkflow(@RequestBody Long id) {
            ShipplanEntity shipplanEntity = shipplanService.queryObject(id);
        if (shipplanEntity == null) {
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
    @RequiresPermissions("shipplan:update")
    public R update(@RequestBody ShipplanEntity shipplan) {
            shipplanService.update(shipplan);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("shipplan:delete")
    public R delete(@RequestBody Long[]ids) {
            shipplanService.deleteBatch(ids);

        return R.ok();
    }



}
