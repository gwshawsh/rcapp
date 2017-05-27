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

import com.ruanchuangsoft.platform.entity.PortEntity;
import com.ruanchuangsoft.platform.service.PortService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 港口管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:14:43
 */
@Controller
@RequestMapping("port")
public class PortController extends AbstractController {
	@Autowired
	private PortService portService;

	@RequestMapping("/port")
	public String list(){
		return "port/port";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/port");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("port:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<PortEntity> portList = portService.queryList(map);
		int total = portService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(portList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("port:info")
	public R info(@PathVariable("id") Long id){
		PortEntity port = portService.queryObject(id);

		return R.ok().put("port", port);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("port:save")
	public R save(@RequestBody PortEntity port){
		portService.save(port);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("port:update")
	public R update(@RequestBody PortEntity port){
		portService.update(port);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("port:delete")
	public R delete(@RequestBody Long[] ids){
		portService.deleteBatch(ids);

		return R.ok();
	}

}
