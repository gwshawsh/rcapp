package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;
import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import com.ruanchuangsoft.platform.service.StorecontractdetailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.StorecontractmainEntity;
import com.ruanchuangsoft.platform.service.StorecontractmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 仓储合同
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 20:39:26
 */
@Controller
@RequestMapping("storecontractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class StorecontractmainController extends AbstractController {
	@Autowired
	private StorecontractmainService storecontractmainService;

	@Autowired
	private StorecontractdetailService storecontractdetailService;


	@RequestMapping("/storecontractmain")
	public String list(){
		return "storecontractmain/storecontractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/storecontractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("storecontractmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<StorecontractmainEntity> storecontractmainList = storecontractmainService.queryList(map);
		int total = storecontractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(storecontractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/listdetail")
	@RequiresPermissions("storecontractmain:list")
	public R listdetail(Long formid,Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("formid",formid);

		//查询列表数据
		List<StorecontractdetailEntity> storecontractdetailList = storecontractdetailService.queryList(map);
		int total = storecontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(storecontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}




	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storecontractmain:info")
	public R info(@PathVariable("id") Long id){
		StorecontractmainEntity storecontractmain = storecontractmainService.queryObject(id);

		return R.ok().put("storecontractmain", storecontractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("storecontractmain:save")
	public R save(@RequestBody StorecontractmainEntity storecontractmain){
		if(storecontractmain.getBillno().equals("*")){
			String billno=getBillNo("SC");
			storecontractmain.setBillno(billno);
			if(storecontractmain.getDetails()!=null&&storecontractmain.getDetails().size()>0){
				for(StorecontractdetailEntity item:storecontractmain.getDetails()){
					item.setBillno(billno);

				}
			}
		}

		storecontractmainService.save(storecontractmain);

		for(StorecontractdetailEntity item:storecontractmain.getDetails()){
			storecontractdetailService.save(item);
		}

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("storecontractmain:update")
	public R update(@RequestBody StorecontractmainEntity storecontractmain){
		storecontractmainService.update(storecontractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("storecontractmain:delete")
	public R delete(@RequestBody Long[] ids){
		storecontractmainService.deleteBatch(ids);

		return R.ok();
	}

}
