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

import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;
import com.ruanchuangsoft.platform.service.BudgetdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 预算明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
@Controller
@RequestMapping("budgetdetail")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BudgetdetailController extends AbstractController {
	@Autowired
	private BudgetdetailService budgetdetailService;

	@RequestMapping("/budgetdetail")
	public String list(){
		return "budgetdetail/budgetdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/budgetdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("budgetdetail:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				BudgetdetailEntity param = JSON.parseObject(tmpquery, BudgetdetailEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("accountid", param.getAccountid());
                        	        map.put("name", param.getName());
                        	        map.put("usage", param.getUsage());
                        	        map.put("remark", param.getRemark());
                        	        map.put("planmoney", param.getPlanmoney());
                        	        map.put("usagemoney", param.getUsagemoney());
                        	        map.put("leftmoney", param.getLeftmoney());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<BudgetdetailEntity> budgetdetailList = budgetdetailService.queryList(map);
		int total = budgetdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(budgetdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("budgetdetail:info")
	public R info(@PathVariable("id") Long id){
		BudgetdetailEntity budgetdetail = budgetdetailService.queryObject(id);

		return R.ok().put("budgetdetail", budgetdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("budgetdetail:save")
	public R save(@RequestBody BudgetdetailEntity budgetdetail){
		budgetdetailService.save(budgetdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("budgetdetail:update")
	public R update(@RequestBody BudgetdetailEntity budgetdetail){
		budgetdetailService.update(budgetdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("budgetdetail:delete")
	public R delete(@RequestBody Long[] ids){
		budgetdetailService.deleteBatch(ids);

		return R.ok();
	}

}
