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

import com.ruanchuangsoft.platform.entity.BankaccountEntity;
import com.ruanchuangsoft.platform.service.BankaccountService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 银行账户表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
@Controller
@RequestMapping("bankaccount")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BankaccountController extends AbstractController {
	@Autowired
	private BankaccountService bankaccountService;

	@RequestMapping("/bankaccount")
	public String list(){
		return "bankaccount/bankaccount";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/bankaccount");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("bankaccount:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BankaccountEntity> bankaccountList = bankaccountService.queryList(map);
		int total = bankaccountService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(bankaccountList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("bankaccount:info")
	public R info(@PathVariable("id") Long id){
		BankaccountEntity bankaccount = bankaccountService.queryObject(id);

		return R.ok().put("bankaccount", bankaccount);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("bankaccount:save")
	public R save(@RequestBody BankaccountEntity bankaccount){
		bankaccountService.save(bankaccount);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("bankaccount:update")
	public R update(@RequestBody BankaccountEntity bankaccount){
		bankaccountService.update(bankaccount);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("bankaccount:delete")
	public R delete(@RequestBody Long[] ids){
		bankaccountService.deleteBatch(ids);

		return R.ok();
	}

}
