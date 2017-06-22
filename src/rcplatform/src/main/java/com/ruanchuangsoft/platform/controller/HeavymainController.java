package com.ruanchuangsoft.platform.controller;

import java.util.*;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.controller.AbstractController;

import com.ruanchuangsoft.platform.entity.*;
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

import com.ruanchuangsoft.platform.service.HeavymainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 重箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
@Controller
@RequestMapping("heavymain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class HeavymainController extends AbstractController {
    @Autowired
    private HeavymainService heavymainService;

    @Autowired
    private TransboxmainService transboxmainService;

    @RequestMapping("/heavymain")
    public String list() {
        return "heavymain/heavymain";
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("buss/heavymain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("heavymain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                HeavymainEntity param = JSON.parseObject(tmpquery, HeavymainEntity.class);
                map.put("id", param.getId());
                map.put("billno", param.getBillno());
                map.put("orgid", param.getOrgid());
                map.put("ladingcode", param.getLadingcode());
                map.put("shipname", param.getShipname());
                map.put("flight", param.getFlight());
                map.put("portid", param.getPortid());
                map.put("boxqty", param.getBoxqty());
                map.put("boxtype", param.getBoxtype());
                map.put("takeboxplaceid", param.getTakeboxplaceid());
                map.put("endplaceid", param.getEndplaceid());
                map.put("bgnshipdatetime", param.getBgnshipdatetime());
                map.put("endshipdatetime", param.getEndshipdatetime());
                map.put("bgnplanarrtime", param.getBgnplanarrtime());
                map.put("endplanarrtime", param.getEndplanarrtime());
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
        List<HeavymainEntity> heavymainList = heavymainService.queryList(map);
        int total = heavymainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(heavymainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("heavymain:info")
    public R info(@PathVariable("id") Long id) {
        HeavymainEntity heavymain = heavymainService.queryObject(id);

        return R.ok().put("heavymain", heavymain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("heavymain:save")
    public R save(@RequestBody HeavymainEntity heavymain) {
        heavymainService.save(heavymain);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("heavymain:update")
    public R update(@RequestBody HeavymainEntity heavymain) {
        heavymainService.update(heavymain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("heavymain:delete")
    public R delete(@RequestBody Long[] ids) {
        heavymainService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 审核要想计划,自动生成方向计划,同时关联合同,生成应收费用
     */
    @ResponseBody
    @RequestMapping("/audit")
    @RequiresPermissions("heavymain:audit")
    public R audit(@RequestBody Long[] ids) {
        for (long id : ids) {
            HeavymainEntity heavymainEntity = heavymainService.queryObject(id);
            if (heavymainEntity != null) {
                if (heavymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                heavymainEntity.setBillstatus(EmptyBillStatus.AUDIT);
                heavymainEntity.setAccdate(new Date());
                heavymainEntity.setAccuser(ShiroUtils.getUserName());
                heavymainEntity.setUptdate(new Date());
                heavymainService.update(heavymainEntity);


                //生成运输计划主表
                TransboxmainEntity transboxmainEntity = new TransboxmainEntity();
                String billno = getBillNo("TS");
                transboxmainEntity.setBillno(billno);
                transboxmainEntity.setRefbillno(heavymainEntity.getBillno());
                transboxmainEntity.setRefbilltype(TranBillType.HEAVYBILL);
                transboxmainEntity.setEndplaceid(heavymainEntity.getEndplaceid());
                transboxmainEntity.setLadingcode(heavymainEntity.getLadingcode());
                transboxmainEntity.setShipname(heavymainEntity.getShipname());
                transboxmainEntity.setFlight(heavymainEntity.getFlight());
                transboxmainEntity.setPortid(heavymainEntity.getPortid());
                transboxmainEntity.setBoxqty(heavymainEntity.getBoxqty());
                transboxmainEntity.setBoxtype(heavymainEntity.getBoxtype());
                transboxmainEntity.setTakeboxplaceid(heavymainEntity.getTakeboxplaceid());
                transboxmainEntity.setBgnplanarrtime(heavymainEntity.getBgnplanarrtime());
                transboxmainEntity.setEndplanarrtime(heavymainEntity.getEndplanarrtime());
                transboxmainEntity.setMakedate(new Date());
                transboxmainEntity.setMakeuser(ShiroUtils.getUserName());
                transboxmainEntity.setUptdate(new Date());
                List<TransboxdetailEntity> lstTransDetail = new ArrayList<>();
                for (int i = 0; i < heavymainEntity.getBoxqty(); i++) {

                    TransboxdetailEntity tsDetail = new TransboxdetailEntity();
                    tsDetail.setBillno(billno);
                    tsDetail.setBillno(billno);
                    tsDetail.setSerialno((long) i);
                    tsDetail.setBoxno("");
                    tsDetail.setPlanarrvetime(tsDetail.getPlanarrvetime());
                    tsDetail.setStartplaceid1(heavymainEntity.getTakeboxplaceid());
                    tsDetail.setStartplaceid2(heavymainEntity.getTakeboxplaceid());
                    tsDetail.setEndplaceid(heavymainEntity.getEndplaceid());
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
    @RequiresPermissions("heavymain:audit")
    public R unaudit(@RequestBody Long[] ids) {
        for (long id : ids) {
            HeavymainEntity heavymainEntity = heavymainService.queryObject(id);
            if (heavymainEntity != null) {
                if (heavymainEntity.getBillstatus().equals(EmptyBillStatus.AUDIT)) {
                    return R.error(1, "单据已经审核,不能重复审核");
                }
                heavymainEntity.setBillstatus(EmptyBillStatus.NEW);
                heavymainEntity.setAccdate(new Date());
                heavymainEntity.setAccuser("");
                heavymainEntity.setUptdate(new Date());
                heavymainService.update(heavymainEntity);

                //查找已经生成的运输任务
                //transboxmainService.queryObject()
                Map<String, Object> map = new HashMap<>();

                map.put("refbillno", heavymainEntity.getBillno());
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
