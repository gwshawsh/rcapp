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

import com.ruanchuangsoft.platform.entity.FeeinfoEntity;
import com.ruanchuangsoft.platform.service.FeeinfoService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 费用项目
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-22 23:13:03
 */
@Controller
@RequestMapping("feeinfo")
public class FeeinfoController extends AbstractController {
	@Autowired
	private FeeinfoService feeinfoService;

	@RequestMapping("/feeinfo")
	public String list(){
		return "feeinfo/feeinfo";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/feeinfo");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("feeinfo:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<FeeinfoEntity> feeinfoList = feeinfoService.queryList(map);
		int total = feeinfoService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(feeinfoList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 选择菜单(添加、修改菜单)
     */
    @ResponseBody
    @RequestMapping("/select")
    @RequiresPermissions("feeinfo:select")
    public R select() {
        //查询列表数据
        Map<String, Object> map = new HashMap<>();
        List<FeeinfoEntity> feeinfoList = feeinfoService.queryList(map);

        //添加顶级菜单
		FeeinfoEntity root = new FeeinfoEntity();
        root.setId(0L);
        root.setName("费用项目");
        root.setParentId(-1L);
        root.setOpen(true);
		feeinfoList.add(root);

        return R.ok().put("treeList", feeinfoList);
    }



    /**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("feeinfo:info")
	public R info(@PathVariable("id") Long id){
		FeeinfoEntity feeinfo = feeinfoService.queryObject(id);

		return R.ok().put("feeinfo", feeinfo);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("feeinfo:save")
	public R save(@RequestBody FeeinfoEntity feeinfo){
		feeinfoService.save(feeinfo);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("feeinfo:update")
	public R update(@RequestBody FeeinfoEntity feeinfo){
		feeinfoService.update(feeinfo);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("feeinfo:delete")
	public R delete(@RequestBody Long[] ids){
		feeinfoService.deleteBatch(ids);

		return R.ok();
	}

}
