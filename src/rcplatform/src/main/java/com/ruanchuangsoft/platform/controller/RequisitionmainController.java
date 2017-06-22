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

import com.ruanchuangsoft.platform.entity.RequisitionmainEntity;
import com.ruanchuangsoft.platform.service.RequisitionmainService;
import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;
import com.ruanchuangsoft.platform.service.RequisitiondetailService;

import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请购主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:53:05
 */
@Controller
@RequestMapping("requisitionmain")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class RequisitionmainController extends AbstractController {
	@Autowired
	private RequisitionmainService requisitionmainService;

    @Autowired
    private RequisitiondetailService requisitiondetailService;

    @RequestMapping("/requisitionmain")
	public String list(){
		return "requisitionmain/requisitionmain";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/requisitionmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("requisitionmain:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<RequisitionmainEntity> requisitionmainList = requisitionmainService.queryList(map);
		int total = requisitionmainService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(requisitionmainList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/listdetail")
    @RequiresPermissions("requisitionmain:list")
    public R listdetail(Long formid,Integer page, Integer limit){
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("formid",formid);

        //查询列表数据
        List<RequisitiondetailEntity> requisitiondetailList = requisitiondetailService.queryList(map);
        int total = requisitiondetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(requisitiondetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }

	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("requisitionmain:info")
	public R info(@PathVariable("id") Long id){
		RequisitionmainEntity requisitionmain = requisitionmainService.queryObject(id);

        //查询明细数据
        Map<String, Object> map = new HashMap<>();
        map.put("formid",id);

        List<RequisitiondetailEntity> requisitiondetailList = requisitiondetailService.queryList(map);
		requisitionmain.setDetails(requisitiondetailList );

		return R.ok().put("requisitionmain", requisitionmain);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("requisitionmain:save")
	public R save(@RequestBody RequisitionmainEntity requisitionmain){
        if(requisitionmain.getBillno().equals("*")){
            String billno=getBillNo("**");
			requisitionmain.setBillno(billno);
            if(requisitionmain.getDetails()!=null&&requisitionmain.getDetails().size()>0){
                for(RequisitiondetailEntity item:requisitionmain.getDetails()){
                    item.setBillno(billno);
                }
            }
        }

		requisitionmainService.save(requisitionmain);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("requisitionmain:update")
	public R update(@RequestBody RequisitionmainEntity requisitionmain){
		requisitionmainService.update(requisitionmain);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("requisitionmain:delete")
	public R delete(@RequestBody Long[] ids){
		requisitionmainService.deleteBatch(ids);

		return R.ok();
	}

    /**
     * 审核
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("requisitionmain:audit")
    public R audit(@RequestBody Long[] ids){
			requisitionmainService.auditBatch(ids);

        return R.ok();
    }


    /**
     * 反审核
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("requisitionmain:unaudit")
    public R unaudit(@RequestBody Long[] ids){
			requisitionmainService.unauditBatch(ids);

        return R.ok();
    }

}
