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

import com.ruanchuangsoft.platform.entity.RepaircontractmainEntity;
import com.ruanchuangsoft.platform.service.RepaircontractmainService;
import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;
import com.ruanchuangsoft.platform.service.RepaircontractdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 机械维修合同
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
@Controller
@RequestMapping("repaircontractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RepaircontractmainController extends AbstractController {
	@Autowired
	private RepaircontractmainService repaircontractmainService;

    @Autowired
    private RepaircontractdetailService repaircontractdetailService;

    @RequestMapping("/repaircontractmain")
	public String list(){
		return "repaircontractmain/repaircontractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/repaircontractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("repaircontractmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<RepaircontractmainEntity> repaircontractmainList = repaircontractmainService.queryList(map);
		int total = repaircontractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(repaircontractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("repaircontractmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

        //查询列表数据
        List<RepaircontractdetailEntity> repaircontractdetailList = repaircontractdetailService.queryList(map);
        int total = repaircontractdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(repaircontractdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("repaircontractmain:info")
	public R info(@PathVariable("id") Long id){
		RepaircontractmainEntity repaircontractmain = repaircontractmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<RepaircontractdetailEntity> repaircontractdetailList = repaircontractdetailService.queryList(map);
		repaircontractmain.setDetails(repaircontractdetailList );

		return R.ok().put("repaircontractmain", repaircontractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("repaircontractmain:save")
	public R save(@RequestBody RepaircontractmainEntity repaircontractmain){
        if(repaircontractmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			repaircontractmain.setBillno(billno);
            if(repaircontractmain.getDetails()!=null&&repaircontractmain.getDetails().size()>0){
                for(RepaircontractdetailEntity item:repaircontractmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		repaircontractmainService.save(repaircontractmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("repaircontractmain:update")
	public R update(@RequestBody RepaircontractmainEntity repaircontractmain){
		repaircontractmainService.update(repaircontractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("repaircontractmain:delete")
	public R delete(@RequestBody Long[] ids){
		repaircontractmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("repaircontractmain:audit")
    public R audit(@RequestBody Long[] ids){
			repaircontractmainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("repaircontractmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			repaircontractmainService.unauditBatch(ids);

        return R.ok();
    }

}
