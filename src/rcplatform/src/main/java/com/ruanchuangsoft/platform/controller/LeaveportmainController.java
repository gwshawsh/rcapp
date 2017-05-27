package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.LeaveportmainEntity;
import com.ruanchuangsoft.platform.service.LeaveportmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 疏港计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
@Controller
@RequestMapping("leaveportmain")
public class LeaveportmainController extends AbstractController {
	@Autowired
	private LeaveportmainService leaveportmainService;

	@RequestMapping("/leaveportmain")
	public String list(){
		return "leaveportmain/leaveportmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/leaveportmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("leaveportmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<LeaveportmainEntity> leaveportmainList = leaveportmainService.queryList(map);
		int total = leaveportmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(leaveportmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("leaveportmain:info")
	public R info(@PathVariable("id") Long id){
		LeaveportmainEntity leaveportmain = leaveportmainService.queryObject(id);

		return R.ok().put("leaveportmain", leaveportmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("leaveportmain:save")
	public R save(@RequestBody LeaveportmainEntity leaveportmain){
		leaveportmainService.save(leaveportmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("leaveportmain:update")
	public R update(@RequestBody LeaveportmainEntity leaveportmain){
		leaveportmainService.update(leaveportmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("leaveportmain:delete")
	public R delete(@RequestBody Long[] ids){
		leaveportmainService.deleteBatch(ids);

		return R.ok();
	}

}
