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

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import com.ruanchuangsoft.platform.service.OrderdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订购明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-23 17:35:42
 */
@Controller
@RequestMapping("orderdetail")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class OrderdetailController extends AbstractController {
    @Autowired
    private OrderdetailService orderdetailService;

    @RequestMapping("/orderdetail")
    public String list() {
        return "orderdetail/orderdetail";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/orderdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("orderdetail:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    OrderdetailEntity param = JSON.parseObject(tmpquery, OrderdetailEntity.class);
                                    if(param.getId()!=null)
                        map.put("id", param.getId());
                                    if(param.getBillno()!=null)
                        map.put("billno", param.getBillno());
                                    if(param.getSerialno()!=null)
                        map.put("serialno", param.getSerialno());
                                    if(param.getGoodsid()!=null)
                        map.put("goodsid", param.getGoodsid());
                                    if(param.getGoodscount()!=null)
                        map.put("goodscount", param.getGoodscount());
                                    if(param.getGoodsspec()!=null)
                        map.put("goodsspec", param.getGoodsspec());
                                    if(param.getGoodsuse()!=null)
                        map.put("goodsuse", param.getGoodsuse());
                                    if(param.getGoodsprice()!=null)
                        map.put("goodsprice", param.getGoodsprice());
                                    if(param.getGoodscost()!=null)
                        map.put("goodscost", param.getGoodscost());
                                    if(param.getEnddate()!=null)
                        map.put("enddate", param.getEnddate());
                                    if(param.getUptdate()!=null)
                        map.put("uptdate", param.getUptdate());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<OrderdetailEntity> orderdetailList = orderdetailService.queryList(map);
        int total = orderdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(orderdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("orderdetail:info")
    public R info(@PathVariable("id") Long id) {
            OrderdetailEntity orderdetail = orderdetailService.queryObject(id);

        return R.ok().put("orderdetail", orderdetail);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("orderdetail:save")
    public R save(@RequestBody OrderdetailEntity orderdetail) {
                      orderdetailService.save(orderdetail);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("orderdetail:update")
    public R submitworkflow(@RequestBody Long id) {
            OrderdetailEntity orderdetailEntity = orderdetailService.queryObject(id);
        if (orderdetailEntity == null) {
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
    @RequiresPermissions("orderdetail:update")
    public R update(@RequestBody OrderdetailEntity orderdetail) {
            orderdetailService.update(orderdetail);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("orderdetail:delete")
    public R delete(@RequestBody Long[]ids) {
            orderdetailService.deleteBatch(ids);

        return R.ok();
    }


   
}
