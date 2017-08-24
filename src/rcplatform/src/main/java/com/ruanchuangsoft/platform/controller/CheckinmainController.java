package com.ruanchuangsoft.platform.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.ruanchuangsoft.platform.entity.CheckinmainEntity;
import com.ruanchuangsoft.platform.service.CheckinmainService;
import com.ruanchuangsoft.platform.utils.PageUtils;
import com.ruanchuangsoft.platform.utils.R;
import org.springframework.web.servlet.ModelAndView;

/**
 * 签到表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-14 10:36:04
 */
@Controller
@RequestMapping("checkinmain")
@Transactional(rollbackFor = {RuntimeException.class, Exception.class})
public class CheckinmainController extends AbstractController {
    @Autowired
    private CheckinmainService checkinmainService;

    @RequestMapping("/checkinmain")
    public String list() {
        return "checkinmain/checkinmain" ;
    }


    @RequestMapping("/index")
    public ModelAndView index() {

        setViewname("abc/checkinmain");
        ModelAndView view = getModelAndView();
//		initModelAndViewI18N(view,keys);
        return view;

    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("checkinmain:list")
    public R list(Integer page, Integer limit, String query) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (query != null && query.length() > 0) {
            try {
                String tmpquery = query.replaceAll("&quot;", "\"");
                CheckinmainEntity param = JSON.parseObject(tmpquery, CheckinmainEntity.class);
                if (param.getId() != null)
                    map.put("id", param.getId());
                if (param.getUserId() != null)
                    map.put("userId", param.getUserId());

                if (param.getAddress() != null)
                    map.put("address", param.getAddress());

                if (param.getDate() != null)
                    map.put("date", param.getDate());

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //查询列表数据
        List<CheckinmainEntity> checkinmainList = checkinmainService.queryList(map);
        int total = checkinmainService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(checkinmainList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     *手机按月查询列表
     */
    @ResponseBody
    @RequestMapping("/listmonth")
    public R listMonth(String month) {
        Date date = DateUtil.parse(month,"yyyy-MM");
       Long  userId = ShiroUtils.getUserId();
        Map<String, Object> map = new HashMap<>();
        map.put("user_id",userId);
        map.put("begin",DateUtil.beginOfMonth(date));
        map.put("end",DateUtil.endOfMonth(date));

        List<CheckinmainEntity> checkinmainList = checkinmainService.queryList(map);
        return R.ok().put("list", checkinmainList);
    }

    /**
     *手机查询当日
     */
    @ResponseBody
    @RequestMapping("/listtoday")
    public R listToday() {
        Date date = new Date();
        Map<String, Object> map = new HashMap<>();
        map.put("user_id",ShiroUtils.getUserId());
        map.put("begin",DateUtil.beginOfDay(date));
        map.put("end",DateUtil.endOfDay(date));
        List<CheckinmainEntity> checkinmainList = checkinmainService.queryList(map);
        return R.ok().put("list", checkinmainList);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("checkinmain:info")
    public R info(@PathVariable("id") Long id) {
        CheckinmainEntity checkinmain = checkinmainService.queryObject(id);

        return R.ok().put("checkinmain", checkinmain);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresAuthentication
    public R save(@RequestBody CheckinmainEntity checkinmain) {
        checkinmain.setUserId(ShiroUtils.getUserId());
        checkinmain.setDate(DateUtil.date());
        checkinmainService.save(checkinmain);

        return R.ok();
    }

    /**
     * 提交
     */
    @ResponseBody
    @RequestMapping("/submitworkflow")
    @RequiresPermissions("checkinmain:update")
    public R submitworkflow(@RequestBody Long id) {
        CheckinmainEntity checkinmainEntity = checkinmainService.queryObject(id);
        if (checkinmainEntity == null) {
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
    @RequiresPermissions("checkinmain:update")
    public R update(@RequestBody CheckinmainEntity checkinmain) {
        checkinmainService.update(checkinmain);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("checkinmain:delete")
    public R delete(@RequestBody Long[] ids) {
        checkinmainService.deleteBatch(ids);

        return R.ok();
    }


}
