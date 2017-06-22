package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import com.ruanchuangsoft.platform.service.PaymentdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 付款明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:54:18
 */
@Controller
@RequestMapping("paymentdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PaymentdetailController extends AbstractController {
	@Autowired
	private PaymentdetailService paymentdetailService;

	@RequestMapping("/paymentdetail")
	public String list(){
		return "paymentdetail/paymentdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/paymentdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("paymentdetail:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				PaymentdetailEntity param = JSON.parseObject(tmpquery, PaymentdetailEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("goodsid", param.getGoodsid());
                        	        map.put("goodscount", param.getGoodscount());
                        	        map.put("goodsprice", param.getGoodsprice());
                        	        map.put("goodscost", param.getGoodscost());
                        	        map.put("goodsspec", param.getGoodsspec());
                        	        map.put("goodsuse", param.getGoodsuse());
                        	        map.put("enddate", param.getEnddate());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

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
	@RequiresPermissions("paymentdetail:info")
	public R info(@PathVariable("id") Long id){
		PaymentdetailEntity paymentdetail = paymentdetailService.queryObject(id);

		return R.ok().put("paymentdetail", paymentdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("paymentdetail:save")
	public R save(@RequestBody PaymentdetailEntity paymentdetail){
		paymentdetailService.save(paymentdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("paymentdetail:update")
	public R update(@RequestBody PaymentdetailEntity paymentdetail){
		paymentdetailService.update(paymentdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("paymentdetail:delete")
	public R delete(@RequestBody Long[] ids){
		paymentdetailService.deleteBatch(ids);

		return R.ok();
	}

}
