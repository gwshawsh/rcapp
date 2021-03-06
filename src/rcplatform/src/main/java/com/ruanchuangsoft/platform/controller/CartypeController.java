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

import com.ruanchuangsoft.platform.entity.CartypeEntity;
import com.ruanchuangsoft.platform.service.CartypeService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 车辆类型
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
@Controller
@RequestMapping("cartype")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class CartypeController extends AbstractController {
    @Autowired
    private CartypeService cartypeService;

    @RequestMapping("/cartype")
    public String list() {
        return "cartype/cartype";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/cartype");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("cartype:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    CartypeEntity param = JSON.parseObject(tmpquery, CartypeEntity.class);
                                    map.put("id", param.getId());
                                    map.put("cartypecode", param.getCartypecode());
                                    map.put("cartypename", param.getCartypename());
                                    map.put("uptdate", param.getUptdate());
                                    map.put("remark", param.getRemark());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<CartypeEntity> cartypeList = cartypeService.queryList(map);
        int total = cartypeService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(cartypeList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("cartype:info")
    public R info(@PathVariable("id") Long id) {
            CartypeEntity cartype = cartypeService.queryObject(id);

        return R.ok().put("cartype", cartype);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("cartype:save")
    public R save(@RequestBody CartypeEntity cartype) {
                      cartypeService.save(cartype);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("cartype:update")
    public R submitworkflow(@RequestBody Long id) {
            CartypeEntity cartypeEntity = cartypeService.queryObject(id);
        if (cartypeEntity == null) {
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
    @RequiresPermissions("cartype:update")
    public R update(@RequestBody CartypeEntity cartype) {
            cartypeService.update(cartype);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("cartype:delete")
    public R delete(@RequestBody Long[]ids) {
            cartypeService.deleteBatch(ids);

        return R.ok();
    }



}
