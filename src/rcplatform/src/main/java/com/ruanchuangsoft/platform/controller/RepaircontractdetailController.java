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

import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;
import com.ruanchuangsoft.platform.service.RepaircontractdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 机械维修合同明细
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
@Controller
@RequestMapping("repaircontractdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RepaircontractdetailController extends AbstractController {
	@Autowired
	private RepaircontractdetailService repaircontractdetailService;

	@RequestMapping("/repaircontractdetail")
	public String list(){
		return "repaircontractdetail/repaircontractdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/repaircontractdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("repaircontractdetail:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				RepaircontractdetailEntity param = JSON.parseObject(tmpquery, RepaircontractdetailEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("goodsid", param.getGoodsid());
                        	        map.put("boxtype", param.getBoxtype());
                        	        map.put("weighttype", param.getWeighttype());
                        	        map.put("price", param.getPrice());
                        	        map.put("transprice", param.getTransprice());
                        	        map.put("goodsqty", param.getGoodsqty());
                        	        map.put("total", param.getTotal());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<RepaircontractdetailEntity> repaircontractdetailList = repaircontractdetailService.queryList(map);
		int total = repaircontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(repaircontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("repaircontractdetail:info")
	public R info(@PathVariable("id") Long id){
		RepaircontractdetailEntity repaircontractdetail = repaircontractdetailService.queryObject(id);

		return R.ok().put("repaircontractdetail", repaircontractdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("repaircontractdetail:save")
	public R save(@RequestBody RepaircontractdetailEntity repaircontractdetail){
		repaircontractdetailService.save(repaircontractdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("repaircontractdetail:update")
	public R update(@RequestBody RepaircontractdetailEntity repaircontractdetail){
		repaircontractdetailService.update(repaircontractdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("repaircontractdetail:delete")
	public R delete(@RequestBody Long[] ids){
		repaircontractdetailService.deleteBatch(ids);

		return R.ok();
	}

}
