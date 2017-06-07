package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TranscontractdetailEntity;
import com.ruanchuangsoft.platform.service.TranscontractdetailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.TranscontractmainEntity;
import com.ruanchuangsoft.platform.service.TranscontractmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输合同
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:52:16
 */
@Controller
@RequestMapping("transcontractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TranscontractmainController extends AbstractController {
	@Autowired
	private TranscontractmainService transcontractmainService;

	@Autowired
	private TranscontractdetailService transcontractdetailService;

	@RequestMapping("/transcontractmain")
	public String list(){
		return "transcontractmain/transcontractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("transcontractmain/transcontractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transcontractmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TranscontractmainEntity> transcontractmainList = transcontractmainService.queryList(map);
		int total = transcontractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transcontractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/listdetail")
	@RequiresPermissions("transcontractdetail:list")
	public R listdetail(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TranscontractdetailEntity> transcontractdetailList = transcontractdetailService.queryList(map);
		int total = transcontractdetailService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transcontractdetailList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transcontractmain:info")
	public R info(@PathVariable("id") Long id){
		TranscontractmainEntity transcontractmain = transcontractmainService.queryObject(id);

		return R.ok().put("transcontractmain", transcontractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transcontractmain:save")
	public R save(@RequestBody TranscontractmainEntity transcontractmain){
		if(transcontractmain.getBillno().equals("*")){
			String billno=getBillNo("TC");
			transcontractmain.setBillno(billno);
			if(transcontractmain.getDetails()!=null&&transcontractmain.getDetails().size()>0){
				for(TranscontractdetailEntity item:transcontractmain.getDetails()){
					item.setBillno(billno);

				}
			}
		}

		transcontractmainService.save(transcontractmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transcontractmain:update")
	public R update(@RequestBody TranscontractmainEntity transcontractmain){
		transcontractmainService.update(transcontractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transcontractmain:delete")
	public R delete(@RequestBody Long[] ids){
		transcontractmainService.deleteBatch(ids);

		return R.ok();
	}

}
