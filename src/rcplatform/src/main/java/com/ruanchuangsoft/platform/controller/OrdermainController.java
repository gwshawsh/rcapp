package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.OrdermainEntity;
import com.ruanchuangsoft.platform.service.OrdermainService;
import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import com.ruanchuangsoft.platform.service.OrderdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 订购主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:51:59
 */
@Controller
@RequestMapping("ordermain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class OrdermainController extends AbstractController {
	@Autowired
	private OrdermainService ordermainService;

    @Autowired
    private OrderdetailService orderdetailService;

    @RequestMapping("/ordermain")
	public String list(){
		return "ordermain/ordermain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/ordermain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("ordermain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<OrdermainEntity> ordermainList = ordermainService.queryList(map);
		int total = ordermainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(ordermainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("ordermain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

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
	@RequiresPermissions("ordermain:info")
	public R info(@PathVariable("id") Long id){
		OrdermainEntity ordermain = ordermainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<OrderdetailEntity> orderdetailList = orderdetailService.queryList(map);
		ordermain.setDetails(orderdetailList );

		return R.ok().put("ordermain", ordermain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("ordermain:save")
	public R save(@RequestBody OrdermainEntity ordermain){
        if(ordermain.getBillno().equals("*")){
            String billno=getBillNo("**");
			ordermain.setBillno(billno);
            if(ordermain.getDetails()!=null&&ordermain.getDetails().size()>0){
                for(OrderdetailEntity item:ordermain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		ordermainService.save(ordermain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("ordermain:update")
	public R update(@RequestBody OrdermainEntity ordermain){
		ordermainService.update(ordermain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("ordermain:delete")
	public R delete(@RequestBody Long[] ids){
		ordermainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("ordermain:audit")
    public R audit(@RequestBody Long[] ids){
			ordermainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("ordermain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			ordermainService.unauditBatch(ids);

        return R.ok();
    }

}
