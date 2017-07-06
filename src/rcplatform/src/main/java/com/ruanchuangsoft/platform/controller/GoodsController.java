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

import com.ruanchuangsoft.platform.entity.GoodsEntity;
import com.ruanchuangsoft.platform.service.GoodsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 商品表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
@Controller
@RequestMapping("goods")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class GoodsController extends AbstractController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/goods")
    public String list() {
        return "goods/goods";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/goods");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    GoodsEntity param = JSON.parseObject(tmpquery, GoodsEntity.class);
                                    map.put("id", param.getId());
                                    map.put("classid", param.getClassid());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("spec", param.getSpec());
                                    map.put("unit", param.getUnit());
                                    map.put("remark", param.getRemark());
                                    map.put("price", param.getPrice());
                                    map.put("pricetax", param.getPricetax());
                                    map.put("gcount", param.getGcount());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<GoodsEntity> goodsList = goodsService.queryList(map);
        int total = goodsService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(goodsList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
            GoodsEntity goods = goodsService.queryObject(id);

        return R.ok().put("goods", goods);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("goods:save")
    public R save(@RequestBody GoodsEntity goods) {
                      goodsService.save(goods);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("goods:update")
    public R submitworkflow(@RequestBody Long id) {
            GoodsEntity goodsEntity = goodsService.queryObject(id);
        if (goodsEntity == null) {
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
    @RequiresPermissions("goods:update")
    public R update(@RequestBody GoodsEntity goods) {
            goodsService.update(goods);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("goods:delete")
    public R delete(@RequestBody Long[]ids) {
            goodsService.deleteBatch(ids);

        return R.ok();
    }



}
