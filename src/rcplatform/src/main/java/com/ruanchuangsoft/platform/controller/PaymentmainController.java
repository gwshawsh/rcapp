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

import com.ruanchuangsoft.platform.entity.PaymentmainEntity;
import com.ruanchuangsoft.platform.service.PaymentmainService;
import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import com.ruanchuangsoft.platform.service.PaymentdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 付款主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-15 10:53:56
 */
@Controller
@RequestMapping("paymentmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PaymentmainController extends AbstractController {
	@Autowired
	private PaymentmainService paymentmainService;

    @Autowired
    private PaymentdetailService paymentdetailService;

    @RequestMapping("/paymentmain")
	public String list(){
		return "paymentmain/paymentmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/paymentmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("paymentmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PaymentmainEntity> paymentmainList = paymentmainService.queryList(map);
		int total = paymentmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(paymentmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("paymentmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

        //查询列表数据
        List<PaymentdetailEntity> paymentdetailList = paymentdetailService.queryList(map);
        int total = paymentdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(paymentdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("paymentmain:info")
	public R info(@PathVariable("id") Long id){
		PaymentmainEntity paymentmain = paymentmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<PaymentdetailEntity> paymentdetailList = paymentdetailService.queryList(map);
		paymentmain.setDetails(paymentdetailList );

		return R.ok().put("paymentmain", paymentmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("paymentmain:save")
	public R save(@RequestBody PaymentmainEntity paymentmain){
        if(paymentmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			paymentmain.setBillno(billno);
            if(paymentmain.getDetails()!=null&&paymentmain.getDetails().size()>0){
                for(PaymentdetailEntity item:paymentmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		paymentmainService.save(paymentmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("paymentmain:update")
	public R update(@RequestBody PaymentmainEntity paymentmain){
		paymentmainService.update(paymentmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("paymentmain:delete")
	public R delete(@RequestBody Long[] ids){
		paymentmainService.deleteBatch(ids);

		return R.ok();
	}

}
