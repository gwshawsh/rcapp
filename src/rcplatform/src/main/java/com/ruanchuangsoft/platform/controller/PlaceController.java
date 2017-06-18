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

import com.ruanchuangsoft.platform.entity.PlaceEntity;
import com.ruanchuangsoft.platform.service.PlaceService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 地点管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
@Controller
@RequestMapping("place")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class PlaceController extends AbstractController {
	@Autowired
	private PlaceService placeService;

	@RequestMapping("/place")
	public String list(){
		return "place/place";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/place");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("place:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PlaceEntity> placeList = placeService.queryList(map);
		int total = placeService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(placeList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("place:info")
	public R info(@PathVariable("id") Long id){
		PlaceEntity place = placeService.queryObject(id);

		return R.ok().put("place", place);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("place:save")
	public R save(@RequestBody PlaceEntity place){
		placeService.save(place);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("place:update")
	public R update(@RequestBody PlaceEntity place){
		placeService.update(place);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("place:delete")
	public R delete(@RequestBody Long[] ids){
		placeService.deleteBatch(ids);

		return R.ok();
	}

}
