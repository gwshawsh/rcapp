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

import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.service.TransboxdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:37:11
 */
@Controller
@RequestMapping("transboxmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TransboxmainController extends AbstractController {
	@Autowired
	private TransboxmainService transboxmainService;

    @Autowired
    private TransboxdetailService transboxdetailService;

    @RequestMapping("/transboxmain")
	public String list(){
		return "transboxmain/transboxmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/transboxmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transboxmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<TransboxmainEntity> transboxmainList = transboxmainService.queryList(map);
		int total = transboxmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transboxmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("transboxmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("billno",formid);

        //查询列表数据
        List<TransboxdetailEntity> transboxdetailList = transboxdetailService.queryList(map);
        int total = transboxdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(transboxdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transboxmain:info")
	public R info(@PathVariable("id") Long id){
		TransboxmainEntity transboxmain = transboxmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<TransboxdetailEntity> transboxdetailList = transboxdetailService.queryList(map);
		transboxmain.setDetails(transboxdetailList );

		return R.ok().put("transboxmain", transboxmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transboxmain:save")
	public R save(@RequestBody TransboxmainEntity transboxmain){
        if(transboxmain.getBillno().equals("*")){
            String billno=getBillNo("TS");
			transboxmain.setBillno(billno);
            if(transboxmain.getDetails()!=null&&transboxmain.getDetails().size()>0){
                for(TransboxdetailEntity item:transboxmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		transboxmainService.save(transboxmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transboxmain:update")
	public R update(@RequestBody TransboxmainEntity transboxmain){
		transboxmainService.update(transboxmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transboxmain:delete")
	public R delete(@RequestBody Long[] ids){
		transboxmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("transboxmain:audit")
    public R audit(@RequestBody Long[] ids){
			transboxmainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("transboxmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			transboxmainService.unauditBatch(ids);

        return R.ok();
    }

}
