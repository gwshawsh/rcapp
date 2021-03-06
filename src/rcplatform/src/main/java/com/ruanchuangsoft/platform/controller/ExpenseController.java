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

import com.ruanchuangsoft.platform.entity.ExpenseEntity;
import com.ruanchuangsoft.platform.service.ExpenseService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 报销单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 17:01:14
 */
@Controller
@RequestMapping("expense")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class ExpenseController extends AbstractController {
	@Autowired
	private ExpenseService expenseService;

	@RequestMapping("/expense")
	public String list(){
		return "expense/expense";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/expense");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("expense:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				ExpenseEntity param = JSON.parseObject(tmpquery, ExpenseEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("applyuser", param.getApplyuser());
                        	        map.put("deptid", param.getDeptid());
                        	        map.put("applydate", param.getApplydate());
                        	        map.put("costcategoryid", param.getCostcategoryid());
                        	        map.put("expensemoney", param.getExpensemoney());
                        	        map.put("reason", param.getReason());
                        	        map.put("receiver", param.getReceiver());
                        	        map.put("paytype", param.getPaytype());
                        	        map.put("bankaccount", param.getBankaccount());
                        	        map.put("makeuser", param.getMakeuser());
                        	        map.put("makedate", param.getMakedate());
                        	        map.put("accuser", param.getAccuser());
                        	        map.put("accdate", param.getAccdate());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<ExpenseEntity> expenseList = expenseService.queryList(map);
		int total = expenseService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(expenseList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("expense:info")
	public R info(@PathVariable("id") Long id){
		ExpenseEntity expense = expenseService.queryObject(id);

		return R.ok().put("expense", expense);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("expense:save")
	public R save(@RequestBody ExpenseEntity expense){
		expenseService.save(expense);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("expense:update")
	public R update(@RequestBody ExpenseEntity expense){
		expenseService.update(expense);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("expense:delete")
	public R delete(@RequestBody Long[] ids){
		expenseService.deleteBatch(ids);

		return R.ok();
	}

}
