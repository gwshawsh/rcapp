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

import com.ruanchuangsoft.platform.entity.BuycontractmainEntity;
import com.ruanchuangsoft.platform.service.BuycontractmainService;
import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;
import com.ruanchuangsoft.platform.service.BuycontractdetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 采购合同
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
@Controller
@RequestMapping("buycontractmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BuycontractmainController extends AbstractController {
	@Autowired
	private BuycontractmainService buycontractmainService;

    @Autowired
    private BuycontractdetailService buycontractdetailService;

    @RequestMapping("/buycontractmain")
	public String list(){
		return "buycontractmain/buycontractmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("contract/buycontractmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("buycontractmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<BuycontractmainEntity> buycontractmainList = buycontractmainService.queryList(map);
		int total = buycontractmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(buycontractmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("buycontractmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

        //查询列表数据
        List<BuycontractdetailEntity> buycontractdetailList = buycontractdetailService.queryList(map);
        int total = buycontractdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(buycontractdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("buycontractmain:info")
	public R info(@PathVariable("id") Long id){
		BuycontractmainEntity buycontractmain = buycontractmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<BuycontractdetailEntity> buycontractdetailList = buycontractdetailService.queryList(map);
		buycontractmain.setDetails(buycontractdetailList );

		return R.ok().put("buycontractmain", buycontractmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("buycontractmain:save")
	public R save(@RequestBody BuycontractmainEntity buycontractmain){
        if(buycontractmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			buycontractmain.setBillno(billno);
            if(buycontractmain.getDetails()!=null&&buycontractmain.getDetails().size()>0){
                for(BuycontractdetailEntity item:buycontractmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		buycontractmainService.save(buycontractmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("buycontractmain:update")
	public R update(@RequestBody BuycontractmainEntity buycontractmain){
		buycontractmainService.update(buycontractmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("buycontractmain:delete")
	public R delete(@RequestBody Long[] ids){
		buycontractmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("buycontractmain:audit")
    public R audit(@RequestBody Long[] ids){
			buycontractmainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("buycontractmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			buycontractmainService.unauditBatch(ids);

        return R.ok();
    }

}
