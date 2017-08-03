package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
import com.ruanchuangsoft.platform.entity.AttachmentsEntity;
import com.ruanchuangsoft.platform.enums.BillStatus;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.ContractdetailEntity;
import com.ruanchuangsoft.platform.service.ContractdetailService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 合同明细
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-25 20:40:35
 */
@Controller
@RequestMapping("contractdetail")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class ContractdetailController extends AbstractController {
    @Autowired
    private ContractdetailService contractdetailService;

    @RequestMapping("/contractdetail")
    public String list() {
        return "contractdetail/contractdetail";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("oa/contractdetail");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("contractdetail:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    ContractdetailEntity param = JSON.parseObject(tmpquery, ContractdetailEntity.class);
                                    if(param.getId()!=null)
                        map.put("id", param.getId());
                                    if(param.getBillno()!=null)
                        map.put("billno", param.getBillno());
                                    if(param.getSerialno()!=null)
                        map.put("serialno", param.getSerialno());
                                    if(param.getGoodsid()!=null)
                        map.put("goodsid", param.getGoodsid());
                                    if(param.getGoodscount()!=null)
                        map.put("goodscount", param.getGoodscount());
                                    if(param.getGoodsspec()!=null)
                        map.put("goodsspec", param.getGoodsspec());
                                    if(param.getGoodsuse()!=null)
                        map.put("goodsuse", param.getGoodsuse());
                                    if(param.getGoodsprice()!=null)
                        map.put("goodsprice", param.getGoodsprice());
                                    if(param.getCost()!=null)
                        map.put("cost", param.getCost());
                                    if(param.getUptdate()!=null)
                        map.put("uptdate", param.getUptdate());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<ContractdetailEntity> contractdetailList = contractdetailService.queryList(map);
        int total = contractdetailService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(contractdetailList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("contractdetail:info")
    public R info(@PathVariable("id") Long id) {
            ContractdetailEntity contractdetail = contractdetailService.queryObject(id);

        return R.ok().put("contractdetail", contractdetail);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("contractdetail:save")
    public R save(@RequestBody ContractdetailEntity contractdetail) {
                      contractdetailService.save(contractdetail);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("contractdetail:update")
    public R submitworkflow(@RequestBody Long id) {
            ContractdetailEntity contractdetailEntity = contractdetailService.queryObject(id);
        if (contractdetailEntity == null) {
            return R.error("单据不存在，不能提交");
        }

        //判断是否存在工作流处理列，有则创建处理过程
                                                                                                                                                                                                                


        return R.ok();
    }


    /**
	 * 修改
	 */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("contractdetail:update")
    public R update(@RequestBody ContractdetailEntity contractdetail) {
            contractdetailService.update(contractdetail);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("contractdetail:delete")
    public R delete(@RequestBody Long[]ids) {
            contractdetailService.deleteBatch(ids);

        return R.ok();
    }


   
}
