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

import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;
import com.ruanchuangsoft.platform.service.BuycontractdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 采购合同明细
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
@Controller
@RequestMapping("buycontractdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BuycontractdetailController extends AbstractController {
	@Autowired
	private BuycontractdetailService buycontractdetailService;

	@RequestMapping("/buycontractdetail")
	public String list(){
		return "buycontractdetail/buycontractdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/buycontractdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("buycontractdetail:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				BuycontractdetailEntity param = JSON.parseObject(tmpquery, BuycontractdetailEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("goodsid", param.getGoodsid());
                        	        map.put("spec", param.getSpec());
                        	        map.put("unit", param.getUnit());
                        	        map.put("price", param.getPrice());
                        	        map.put("goodsqty", param.getGoodsqty());
                        	        map.put("total", param.getTotal());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<BuycontractdetailEntity> buycontractdetailList = buycontractdetailService.queryList(map);
		int total = buycontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(buycontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("buycontractdetail:info")
	public R info(@PathVariable("id") Long id){
		BuycontractdetailEntity buycontractdetail = buycontractdetailService.queryObject(id);

		return R.ok().put("buycontractdetail", buycontractdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("buycontractdetail:save")
	public R save(@RequestBody BuycontractdetailEntity buycontractdetail){
		buycontractdetailService.save(buycontractdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("buycontractdetail:update")
	public R update(@RequestBody BuycontractdetailEntity buycontractdetail){
		buycontractdetailService.update(buycontractdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("buycontractdetail:delete")
	public R delete(@RequestBody Long[] ids){
		buycontractdetailService.deleteBatch(ids);

		return R.ok();
	}

}
