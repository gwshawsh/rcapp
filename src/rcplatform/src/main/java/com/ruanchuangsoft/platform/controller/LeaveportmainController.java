package com.ruanchuangsoft.platform.controller;

import java.util.*;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.HeavymainEntity;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.enums.EmptyBillStatus;
import com.ruanchuangsoft.platform.enums.TranBillType;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.LeaveportmainEntity;
import com.ruanchuangsoft.platform.service.LeaveportmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 疏港计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
@Controller
@RequestMapping("leaveportmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class LeaveportmainController extends AbstractController {
    @Autowired
    private LeaveportmainService leaveportmainService;

    @Autowired
    private TransboxmainService transboxmainService;

    @RequestMapping("/leaveportmain")
    public String list() {
        return "leaveportmain/leaveportmain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/leaveportmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("leaveportmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                LeaveportmainEntity param = JSON.parseObject(tmpquery, LeaveportmainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("orgid", param.getOrgid());
                map.put("ladingcode", param.getLadingcode());
                map.put("shipname", param.getShipname());
                map.put("flight", param.getFlight());
                map.put("portid", param.getPortid());
                map.put("shipcompany", param.getShipcompany());
                map.put("boxqty", param.getBoxqty());
                map.put("boxtype", param.getBoxtype());
                map.put("takeboxplaceid", param.getTakeboxplaceid());
                map.put("endplaceid", param.getEndplaceid());
                map.put("planarrporttime", param.getPlanarrporttime());
                map.put("planarrtime", param.getPlanarrtime());
                map.put("remark", param.getRemark());
                map.put("billstatus", param.getBillstatus());
                map.put("makeuser", param.getMakeuser());
                map.put("makedate", param.getMakedate());
                map.put("accuser", param.getAccuser());
                map.put("accdate", param.getAccdate());
                map.put("uptdate", param.getUptdate());

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<LeaveportmainEntity> leaveportmainList = leaveportmainService.queryList(map);
        int total = leaveportmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(leaveportmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("leaveportmain:info")
    public R info(@PathVariable("id") Long id) {
        LeaveportmainEntity leaveportmain = leaveportmainService.queryObject(id);

        return R.ok().put("leaveportmain", leaveportmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("leaveportmain:save")
    public R save(@RequestBody LeaveportmainEntity leaveportmain) {
        if(leaveportmain.getBillno().equalsIgnoreCase("*")) {
            String billno = getBillNo("LP");
            leaveportmain.setBillno(billno);
        }
        leaveportmainService.save(leaveportmain);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("leaveportmain:update")
    public R update(@RequestBody LeaveportmainEntity leaveportmain) {
        leaveportmainService.update(leaveportmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("leaveportmain:delete")
    public R delete(@RequestBody Long[] ids) {
        leaveportmainService.deleteBatch(ids);

        return R.ok();
    }


    /**
     * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("leaveportmain:audit")
    public R audit(@RequestBody Long[] ids) {
        for (long id : ids) {
            LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(id);
            if (leaveportmainEntity != null) {
                if (leaveportmainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                leaveportmainEntity.setBillstatus(EmptyBillStatus.AUDIT);
                leaveportmainEntity.setAccdate(new Date());
                leaveportmainEntity.setAccuser(ShiroUtils.getUserName());
                leaveportmainEntity.setUptdate(new Date());
                leaveportmainService.update(leaveportmainEntity);


                //生成运输计划主表
                TransboxmainEntity transboxmainEntity = new TransboxmainEntity();
                String billno = getBillNo("TS");
                transboxmainEntity.setBillno(billno);
                transboxmainEntity.setRefbillno(leaveportmainEntity.getBillno());
                transboxmainEntity.setRefbilltype(TranBillType.LEAVEPORT);
                transboxmainEntity.setEndplaceid(leaveportmainEntity.getEndplaceid());
                transboxmainEntity.setLadingcode("");
                transboxmainEntity.setShipname("");
                transboxmainEntity.setFlight("");
                transboxmainEntity.setPortid(leaveportmainEntity.getPortid());
                transboxmainEntity.setBoxqty(leaveportmainEntity.getBoxqty());
                transboxmainEntity.setBoxtype(leaveportmainEntity.getBoxtype());
                transboxmainEntity.setTakeboxplaceid(leaveportmainEntity.getTakeboxplaceid());
                transboxmainEntity.setBgnplanarrtime(leaveportmainEntity.getPlanarrporttime());
                transboxmainEntity.setEndplanarrtime(leaveportmainEntity.getPlanarrtime());
                transboxmainEntity.setMakedate(new Date());
                transboxmainEntity.setMakeuser(ShiroUtils.getUserName());
                transboxmainEntity.setUptdate(new Date());
                List<TransboxdetailEntity> lstTransDetail = new ArrayList<>();
                for (int i = 0; i < leaveportmainEntity.getBoxqty(); i++) {

                    TransboxdetailEntity tsDetail = new TransboxdetailEntity();
                    tsDetail.setBillno(billno);
                    tsDetail.setBillno(billno);
                    tsDetail.setSerialno((long) i);
                    tsDetail.setBoxno("");
                    tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
                    tsDetail.setStartplaceid1(leaveportmainEntity.getTakeboxplaceid());
                    tsDetail.setStartplaceid2(leaveportmainEntity.getTakeboxplaceid());
                    tsDetail.setEndplaceid(leaveportmainEntity.getEndplaceid());
                    tsDetail.setUptdate(new Date());
                    lstTransDetail.add(tsDetail);

                }
                transboxmainEntity.setDetails(lstTransDetail);
                transboxmainService.save(transboxmainEntity);


            }
        }


        return R.ok();
    }


    /**
     * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/unaudit")
    @RequiresPermissions("leaveportmain:audit")
    public R unaudit(@RequestBody Long[] ids) {
        for (long id : ids) {
            LeaveportmainEntity leaveportmainEntity = leaveportmainService.queryObject(id);
            if (leaveportmainEntity != null) {
                if (leaveportmainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                leaveportmainEntity.setBillstatus(EmptyBillStatus.NEW);
                leaveportmainEntity.setAccdate(new Date());
                leaveportmainEntity.setAccuser("");
                leaveportmainEntity.setUptdate(new Date());
                leaveportmainService.update(leaveportmainEntity);

                //查找已经生成的运输任务
                //transboxmainService.queryObject()
                Map<String, Object> map = new HashMap<>();

                map.put("refbillno", leaveportmainEntity.getBillno());
                map.put("refbilltype",TranBillType.HEAVYBILL);
                List<TransboxmainEntity> tmpListTransbox= transboxmainService.queryList(map);
                if(tmpListTransbox!=null&&tmpListTransbox.size()>0) {
                    for(TransboxmainEntity item:tmpListTransbox) {
                        transboxmainService.delete(item.getId());
                    }
                }


            }
        }


        return R.ok();
    }

}
