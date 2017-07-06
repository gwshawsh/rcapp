package com.ruanchuangsoft.platform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;
import org.activiti.engine.task.Task;
import com.ruanchuangsoft.platform.enums.AuditType;
import com.ruanchuangsoft.platform.entity.BillcommentsEntity;
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

import com.ruanchuangsoft.platform.entity.BankEntity;
import com.ruanchuangsoft.platform.service.BankService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 银行管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
@Controller
@RequestMapping("bank")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class BankController extends AbstractController {
    @Autowired
    private BankService bankService;

    @RequestMapping("/bank")
    public String list() {
        return "bank/bank";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("base/bank");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("bank:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                    BankEntity param = JSON.parseObject(tmpquery, BankEntity.class);
                                    map.put("id", param.getId());
                                    map.put("code", param.getCode());
                                    map.put("name", param.getName());
                                    map.put("boctid", param.getBoctid());
                                    map.put("address", param.getAddress());
                                    map.put("tel", param.getTel());
                                    map.put("fax", param.getFax());
                                    map.put("man", param.getMan());
                                    map.put("del", param.getDel());
                                    map.put("makeuser", param.getMakeuser());
                                    map.put("makedate", param.getMakedate());
                                    map.put("remark", param.getRemark());
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<BankEntity> bankList = bankService.queryList(map);
        int total = bankService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(bankList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bank:info")
    public R info(@PathVariable("id") Long id) {
            BankEntity bank = bankService.queryObject(id);

        return R.ok().put("bank", bank);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("bank:save")
    public R save(@RequestBody BankEntity bank) {
                      bankService.save(bank);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("bank:update")
    public R submitworkflow(@RequestBody Long id) {
            BankEntity bankEntity = bankService.queryObject(id);
        if (bankEntity == null) {
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
    @RequiresPermissions("bank:update")
    public R update(@RequestBody BankEntity bank) {
            bankService.update(bank);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("bank:delete")
    public R delete(@RequestBody Long[]ids) {
            bankService.deleteBatch(ids);

        return R.ok();
    }




}
