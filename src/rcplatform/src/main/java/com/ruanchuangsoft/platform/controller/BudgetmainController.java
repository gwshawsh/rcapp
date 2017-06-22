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

import com.ruanchuangsoft.platform.entity.BudgetmainEntity;
import com.ruanchuangsoft.platform.service.BudgetmainService;
import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;
import com.ruanchuangsoft.platform.service.BudgetdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 预算计划主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
@Controller
@RequestMapping("budgetmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BudgetmainController extends AbstractController {
	@Autowired
	private BudgetmainService budgetmainService;

    @Autowired
    private BudgetdetailService budgetdetailService;

    @RequestMapping("/budgetmain")
	public String list(){
		return "budgetmain/budgetmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/budgetmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("budgetmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BudgetmainEntity> budgetmainList = budgetmainService.queryList(map);
		int total = budgetmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(budgetmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("budgetmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

        //查询列表数据
        List<BudgetdetailEntity> budgetdetailList = budgetdetailService.queryList(map);
        int total = budgetdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(budgetdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("budgetmain:info")
	public R info(@PathVariable("id") Long id){
		BudgetmainEntity budgetmain = budgetmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<BudgetdetailEntity> budgetdetailList = budgetdetailService.queryList(map);
		budgetmain.setDetails(budgetdetailList );

		return R.ok().put("budgetmain", budgetmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("budgetmain:save")
	public R save(@RequestBody BudgetmainEntity budgetmain){
        if(budgetmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			budgetmain.setBillno(billno);
            if(budgetmain.getDetails()!=null&&budgetmain.getDetails().size()>0){
                for(BudgetdetailEntity item:budgetmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		budgetmainService.save(budgetmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("budgetmain:update")
	public R update(@RequestBody BudgetmainEntity budgetmain){
		budgetmainService.update(budgetmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("budgetmain:delete")
	public R delete(@RequestBody Long[] ids){
		budgetmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("budgetmain:audit")
    public R audit(@RequestBody Long[] ids){
			budgetmainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("budgetmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			budgetmainService.unauditBatch(ids);

        return R.ok();
    }

}
