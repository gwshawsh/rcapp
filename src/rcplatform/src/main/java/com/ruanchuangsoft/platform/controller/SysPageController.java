package com.ruanchuangsoft.platform.controller;

import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 系统页面视图
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月24日 下午11:05:27
 */
@Controller
public class SysPageController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {

		return "index1";
	}

//	@RequestMapping("sys/{url}.html")
//	public String page(@PathVariable("url") String url){
//		return "sys/" + url + "";
//	}

	@RequestMapping("sys/{url}.html")
	public ModelAndView page(@PathVariable("url") String url){
		ModelAndView view = new ModelAndView("sys/" + url + "");
		view.addObject("gUserName", ShiroUtils.getUserName());
		//total 是模板的全局变量，可以直接访问
		return view;

	}
}
