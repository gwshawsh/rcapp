package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.service.TakeboxdetailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;
import com.ruanchuangsoft.platform.service.TakeboxmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 放箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 21:36:50
 */
@Controller
@RequestMapping("takeboxmain")
public class TakeboxmainController extends AbstractController {
	@Autowired
	private TakeboxmainService takeboxmainService;

	@Autowired
	private TakeboxdetailService takeboxdetailService;


	@RequestMapping("/takeboxmain")
	public String list(){
		return "takeboxmain/takeboxmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/takeboxmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("takeboxmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TakeboxmainEntity> takeboxmainList = takeboxmainService.queryList(map);
		int total = takeboxmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(takeboxmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/listdetail")
	@RequiresPermissions("takeboxmain:list")
	public R listdetail(Long formid,Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("formid",formid);
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
	@RequiresPermissions("takeboxmain:info")
	public R info(@PathVariable("id") Long id){
		TakeboxmainEntity takeboxmain = takeboxmainService.queryObject(id);

		Map<String, Object> map = new HashMap<>();
		map.put("formid",id);
		//查询列表数据
		List<TakeboxdetailEntity> takeboxdetailList = takeboxdetailService.queryList(map);
		takeboxmain.setDetails(takeboxdetailList);
		return R.ok().put("takeboxmain", takeboxmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("takeboxmain:save")
	public R save(@RequestBody TakeboxmainEntity takeboxmain){
		if(takeboxmain.getBillno().equals("*")){
			String billno=getBillNo("TB");
			takeboxmain.setBillno(billno);
			if(takeboxmain.getDetails()!=null&&takeboxmain.getDetails().size()>0){
				for(TakeboxdetailEntity item:takeboxmain.getDetails()){
					item.setBillno(billno);
				}
			}
		}
		takeboxmainService.save(takeboxmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("takeboxmain:update")
	public R update(@RequestBody TakeboxmainEntity takeboxmain){
		takeboxmainService.update(takeboxmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("takeboxmain:delete")
	public R delete(@RequestBody Long[] ids){
		takeboxmainService.deleteBatch(ids);

		return R.ok();
	}

}
