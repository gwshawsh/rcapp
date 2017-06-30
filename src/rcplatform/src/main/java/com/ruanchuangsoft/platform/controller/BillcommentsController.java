package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.service.BillcommentsService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 单据审批备注
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-28 16:16:47
 */
@Controller
@RequestMapping("billcomments")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class BillcommentsController extends AbstractController {
	@Autowired
	private BillcommentsService billcommentsService;

	@RequestMapping("/billcomments")
	public String list(){
		return "billcomments/billcomments";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/billcomments");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("billcomments:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				BillcommentsEntity param = JSON.parseObject(tmpquery, BillcommentsEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("billno", param.getBillno());
                        	        map.put("refbilltype", param.getRefbilltype());
                        	        map.put("serialno", param.getSerialno());
                        	        map.put("auditstatus", param.getAuditstatus());
                        	        map.put("remark", param.getRemark());
                        	        map.put("makeuser", param.getMakeuser());
                        	        map.put("makedate", param.getMakedate());
                        	        map.put("uptdate", param.getUptdate());
                        	        map.put("pocessinstanceid", param.getPocessinstanceid());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<BillcommentsEntity> billcommentsList = billcommentsService.queryList(map);
		int total = billcommentsService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(billcommentsList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("billcomments:info")
	public R info(@PathVariable("id") Long id){
		BillcommentsEntity billcomments = billcommentsService.queryObject(id);

		return R.ok().put("billcomments", billcomments);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("billcomments:save")
	public R save(@RequestBody BillcommentsEntity billcomments){
		billcommentsService.save(billcomments);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("billcomments:update")
	public R update(@RequestBody BillcommentsEntity billcomments){
		billcommentsService.update(billcomments);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("billcomments:delete")
	public R delete(@RequestBody Long[] ids){
		billcommentsService.deleteBatch(ids);

		return R.ok();
	}

}
