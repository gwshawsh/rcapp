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

import com.ruanchuangsoft.platform.entity.BaseOpBankEntity;
import com.ruanchuangsoft.platform.service.BaseOpBankService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 银行表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
@Controller
@RequestMapping("baseopbank")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BaseOpBankController extends AbstractController {
	@Autowired
	private BaseOpBankService baseOpBankService;

	@RequestMapping("/baseopbank")
	public String list(){
		return "baseopbank/baseopbank";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/baseopbank");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("baseopbank:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BaseOpBankEntity> baseOpBankList = baseOpBankService.queryList(map);
		int total = baseOpBankService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(baseOpBankList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{bobTid}")
	@RequiresPermissions("baseopbank:info")
	public R info(@PathVariable("bobTid") Integer bobTid){
		BaseOpBankEntity baseOpBank = baseOpBankService.queryObject(bobTid);

		return R.ok().put("baseOpBank", baseOpBank);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("baseopbank:save")
	public R save(@RequestBody BaseOpBankEntity baseOpBank){
		baseOpBankService.save(baseOpBank);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("baseopbank:update")
	public R update(@RequestBody BaseOpBankEntity baseOpBank){
		baseOpBankService.update(baseOpBank);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("baseopbank:delete")
	public R delete(@RequestBody Integer[] bobTids){
		baseOpBankService.deleteBatch(bobTids);

		return R.ok();
	}

}
