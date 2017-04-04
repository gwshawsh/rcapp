package com.ruanchuangsoft.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

		return "index";
	}

	@RequestMapping("sys/{url}.html")
	public String page(@PathVariable("url") String url){
		return "sys/" + url + "";
	}
}
