package com.ruanchuangsoft.platform.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class HttpContextUtils {

	public static HttpServletRequest getHttpServletRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	public static HttpServletResponse getHttpServletResponse(){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
	}

	public static void addCookie( String cookieName, String cookieValue){
		if(cookieValue!=null) {
			String tmpvalue = URLEncoder.encode(cookieValue);
			Cookie newCookie = new Cookie(cookieName, tmpvalue);
			newCookie.setMaxAge(259200);
			newCookie.setPath("/");

			getHttpServletResponse().addCookie(newCookie);
		}
	}


}
