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

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.service.TakeboxdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 放箱计划明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 21:36:50
 */
@Controller
@RequestMapping("takeboxdetail")
public class TakeboxdetailController extends AbstractController {
	@Autowired
	private TakeboxdetailService takeboxdetailService;

	@RequestMapping("/takeboxdetail")
	public String list(){
		return "takeboxdetail/takeboxdetail";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("takeboxdetail/takeboxdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("takeboxdetail:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TakeboxdetailEntity> takeboxdetailList = takeboxdetailService.queryList(map);
		int total = takeboxdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(takeboxdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("takeboxdetail:info")
	public R info(@PathVariable("id") Long id){
		TakeboxdetailEntity takeboxdetail = takeboxdetailService.queryObject(id);

		return R.ok().put("takeboxdetail", takeboxdetail);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("takeboxdetail:save")
	public R save(@RequestBody TakeboxdetailEntity takeboxdetail){
		takeboxdetailService.save(takeboxdetail);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("takeboxdetail:update")
	public R update(@RequestBody TakeboxdetailEntity takeboxdetail){
		takeboxdetailService.update(takeboxdetail);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("takeboxdetail:delete")
	public R delete(@RequestBody Long[] ids){
		takeboxdetailService.deleteBatch(ids);

		return R.ok();
	}

}
