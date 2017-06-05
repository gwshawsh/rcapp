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

import com.ruanchuangsoft.platform.entity.BoxsEntity;
import com.ruanchuangsoft.platform.service.BoxsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;


/**
 * 箱型基础信息表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-02 23:03:41
 */
@Controller
@RequestMapping("boxs")
public class BoxsController extends AbstractController {
	@Autowired
	private BoxsService boxsService;

	@RequestMapping("/boxs")
	public String list(){

		return "boxs/boxs";
	}



    @RequestMapping("/index")
    public ModelAndView index() {
		setViewname("activiti/modeler");
//        setViewname("base/boxs");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("boxs:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BoxsEntity> boxsList = boxsService.queryList(map);
		int total = boxsService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(boxsList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("boxs:info")
	public R info(@PathVariable("id") Long id){
		BoxsEntity boxs = boxsService.queryObject(id);

		return R.ok().put("boxs", boxs);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("boxs:save")
	public R save(@RequestBody BoxsEntity boxs){
		boxsService.save(boxs);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("boxs:update")
	public R update(@RequestBody BoxsEntity boxs){
		boxsService.update(boxs);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("boxs:delete")
	public R delete(@RequestBody Long[] ids){
		boxsService.deleteBatch(ids);

		return R.ok();
	}

}