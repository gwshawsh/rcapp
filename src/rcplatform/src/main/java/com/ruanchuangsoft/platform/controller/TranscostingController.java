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

import com.ruanchuangsoft.platform.entity.TranscostingEntity;
import com.ruanchuangsoft.platform.service.TranscostingService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 运输成本
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 16:20:06
 */
@Controller
@RequestMapping("transcosting")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class TranscostingController extends AbstractController {
	@Autowired
	private TranscostingService transcostingService;

	@RequestMapping("/transcosting")
	public String list(){
		return "transcosting/transcosting";
	}



    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("finance/transcosting");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("transcosting:list")
	public R list(Integer page, Integer limit,String query){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

        if(query!=null&&query.length()>0){
            try {
                String tmpquery =query.replaceAll("&quot;","\"");
				TranscostingEntity param = JSON.parseObject(tmpquery, TranscostingEntity.class);
				        	        map.put("id", param.getId());
                        	        map.put("bgndate", param.getBgndate());
                        	        map.put("enddate", param.getEnddate());
                        	        map.put("lineid", param.getLineid());
                        	        map.put("boxtype", param.getBoxtype());
                        	        map.put("boxprice", param.getBoxprice());
                        	        map.put("remark", param.getRemark());
                        	        map.put("makeuser", param.getMakeuser());
                        	        map.put("makedate", param.getMakedate());
                        	        map.put("accuser", param.getAccuser());
                        	        map.put("accdate", param.getAccdate());
                        	        map.put("uptdate", param.getUptdate());
                
            }catch(Exception e){
                e.printStackTrace();
            }

        }

		//查询列表数据
		List<TranscostingEntity> transcostingList = transcostingService.queryList(map);
		int total = transcostingService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(transcostingList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("transcosting:info")
	public R info(@PathVariable("id") Long id){
		TranscostingEntity transcosting = transcostingService.queryObject(id);

		return R.ok().put("transcosting", transcosting);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("transcosting:save")
	public R save(@RequestBody TranscostingEntity transcosting){
		transcostingService.save(transcosting);

		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("transcosting:update")
	public R update(@RequestBody TranscostingEntity transcosting){
		transcostingService.update(transcosting);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("transcosting:delete")
	public R delete(@RequestBody Long[] ids){
		transcostingService.deleteBatch(ids);

		return R.ok();
	}

}
