package com.ruanchuangsoft.platform.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpContextUtils {

	public static HttpServletRequest getHttpServletRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	public static HttpServletResponse getHttpServletResponse(){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
	}

	public static void addCookie( String cookieName, String cookieValue){
		Cookie newCookie = new Cookie(cookieName, cookieValue);
		newCookie.setMaxAge(259200);

		getHttpServletResponse().addCookie(newCookie);
	}


}
