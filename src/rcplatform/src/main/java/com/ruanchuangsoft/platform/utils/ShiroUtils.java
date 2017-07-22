package com.ruanchuangsoft.platform.utils;

import com.ruanchuangsoft.platform.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;

/**
 * Shiro工具类
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月12日 上午9:49:19
 */
public class ShiroUtils {

	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	public static SysUserEntity getUserEntity() {
		return (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
	}

	public static Long getUserId() {
		return getUserEntity().getId();
	}


	public static String getUserIdStr() {
		return String.valueOf(getUserEntity().getId());
	}

	public static  String getUserName(){
		return getUserEntity().getUsername();
	}

	public static String getUserFullName(){
		return getUserEntity().getFullname();
	}
	
	public static void setSessionAttribute(Object key, Object value) {
		getSession().setAttribute(key, value);
	}

	public static Object getSessionAttribute(Object key) {
		return getSession().getAttribute(key);
	}

//	public static void setUserToCookie(){
//		DefaultWebSecurityManager mng=(DefaultWebSecurityManager)SecurityUtils.getSecurityManager();
//		CookieRememberMeManager cookieRememberMeManager=(CookieRememberMeManager)mng.getRememberMeManager();
//		SimpleCookie simpleCookie=(SimpleCookie)cookieRememberMeManager.getCookie();
//
//	}
	public static boolean isLogin() {
		return SecurityUtils.getSubject().getPrincipal() != null;
	}

	public static void logout() {
		SecurityUtils.getSubject().logout();
	}
	
	public static String getKaptcha(String key) {
		String kaptcha = getSessionAttribute(key).toString();
		getSession().removeAttribute(key);
		return kaptcha;
	}

}
