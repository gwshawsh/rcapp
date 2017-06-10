package com.ruanchuangsoft.platform.controller;

// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
import java.util.*;

import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.GclassEntity;
import com.ruanchuangsoft.platform.service.GclassService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 品类表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-09 18:39:54
 */
@Controller
@RequestMapping("gclass")
public class GclassController extends AbstractController {
	@Autowired
	private GclassService gclassService;

	@RequestMapping("/gclass")
	public String list(){
		return "base/gclass";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/gclass");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("gclass:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<GclassEntity> gclassList = gclassService.queryList(map);
		int total = gclassService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(gclassList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 选择菜单(添加、修改菜单)
     */
    @ResponseBody
    @RequestMapping("/select")
    @RequiresPermissions("gclass:select")
    public R select() {
        //查询列表数据
        Map<String, Object> map = new HashMap<>();
        List<GclassEntity> gclassList = gclassService.queryList(map);

        //添加顶级菜单
		GclassEntity root = new GclassEntity();
        root.setId(0L);
        root.setName("品类表");
        root.setParentid(-1L);
        root.setOpen(true);
		gclassList.add(root);

        return R.ok().put("treeList", gclassList);
    }



    /**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("gclass:info")
	public R info(@PathVariable("id") Long id){
		GclassEntity gclass = gclassService.queryObject(id);

		return R.ok().put("gclass", gclass);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("gclass:save")
	public R save(@RequestBody GclassEntity gclass){
		gclassService.save(gclass);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("gclass:update")
	public R update(@RequestBody GclassEntity gclass){
		gclassService.update(gclass);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("gclass:delete")
	public R delete(@RequestBody Long[] ids){
		gclassService.deleteBatch(ids);

		return R.ok();
	}

}
