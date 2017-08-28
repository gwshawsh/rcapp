package com.ruanchuangsoft.platform.controller;

import com.alibaba.fastjson.JSON;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.ruanchuangsoft.platform.entity.SysUserEntity;
import com.ruanchuangsoft.platform.utils.HttpContextUtils;
import com.ruanchuangsoft.platform.utils.R;
import com.ruanchuangsoft.platform.utils.ShiroUtils;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录相关
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月10日 下午1:15:31
 */
@Controller
public class SysLoginController {
    @Autowired
    private Producer producer;

    @RequestMapping("captcha.jpg")
    public void captcha(HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        //生成文字验证码
        String text = producer.createText();
        //生成图片验证码
        BufferedImage image = producer.createImage(text);
        //保存到shiro session
        ShiroUtils.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
    }

    /**
     * 登录
     */
    @ResponseBody
    @RequestMapping(value = "/sys/login", method = RequestMethod.POST)
    public R login(String username, String password, String captcha) throws IOException {
        //String kaptcha = ShiroUtils.getKaptcha(Constants.KAPTCHA_SESSION_KEY);

        try {
            JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
            Client client = dcf.createClient("http://27.223.89.54:8074/PlantFormService.asmx?wsdl");
            Map<String, String> map = new HashMap<String, String>();


            map.put("YWLB", "111");
            map.put("IDNO", "111");
            map.put("vhc", "111");
            map.put("B_JH_DD", "111");
            map.put("E_JH_DD", "111");
            map.put("B_ADD", "111");
            map.put("E_ADD", "111");
            map.put("BOX_NO", "111");
            map.put("CX", "111");
            map.put("QTY", "111");
            map.put("SHIP_OVOY", "111");
            map.put("TD_NO", "111");
            map.put("B_LINK", "111");
            map.put("B_TEL", "111");
            map.put("E_LINK", "111");
            map.put("E_TEL", "111");
            map.put("SR_NO", "111");
            map.put("ITM", "111");
            map.put("AMTN", "111");
            map.put("B_AREA", "111");
            map.put("E_AREA", "111");
            map.put("note", "111");


//            String json = JSON.toJSONString(map);
            Object objects = client.invoke("Land_TB_Order",  "11","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111","111");
            String tmp = (String) objects;

            String savedata = "[{\"bobAccountno\":\"776655555577\",\"bobAdddate\":1483200000000,\"bobAddpid\":0,\"bobAddress\":\"上海银行测试地址\",\"bobBoctid\":0,\"bobDel\":0,\"bobFax\":\"88999999\",\"bobJobcode\":\"001\",\"bobMan\":\"测试人\",\"bobName\":\"测试单位\",\"bobNote\":\"这是备注\",\"bobTel\":\"88777777\",\"bobTid\":4},{\"bobAccountno\":\"776655555577\",\"bobAdddate\":1483200000000,\"bobAddpid\":0,\"bobAddress\":\"上海银行测试地址2\",\"bobBoctid\":0,\"bobDel\":0,\"bobFax\":\"88999999\",\"bobJobcode\":\"002\",\"bobMan\":\"测试人\",\"bobName\":\"测试单位2\",\"bobNote\":\"这是备注\",\"bobTel\":\"88777777\",\"bobTid\":5},{\"bobAccountno\":\"776655555577\",\"bobAdddate\":1483200000000,\"bobAddpid\":0,\"bobAddress\":\"上海银行测试地址3\",\"bobBoctid\":0,\"bobDel\":0,\"bobFax\":\"88999999\",\"bobJobcode\":\"003\",\"bobMan\":\"测试人\",\"bobName\":\"测试单位3\",\"bobNote\":\"这是备注\",\"bobTel\":\"88777777\",\"bobTid\":6}]";
            Object[] objects1 = client.invoke("saveData", "Base_Op_Bank", "insert", savedata);


        } catch (Exception e) {
            e.printStackTrace();
        }

        //测试阶段暂不校验
//		if(!captcha.equalsIgnoreCase(kaptcha)){
//			return R.error("验证码不正确");
//		}

        try {
            Subject subject = ShiroUtils.getSubject();
            //sha256加密
            password = new Sha256Hash(password).toHex();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(true);
            subject.login(token);
            SysUserEntity userEntity = ShiroUtils.getUserEntity();
            HttpContextUtils.addCookie("userid", String.valueOf(userEntity.getId()));
            HttpContextUtils.addCookie("username", userEntity.getUsername());
            HttpContextUtils.addCookie("userfullname", userEntity.getFullname());
            HttpContextUtils.addCookie("deptid", String.valueOf(userEntity.getDeptId()));
            HttpContextUtils.addCookie("deptname", userEntity.getDeptIdname());


        } catch (UnknownAccountException e) {
            return R.error(e.getMessage());
        } catch (IncorrectCredentialsException e) {
            return R.error(e.getMessage());
        } catch (LockedAccountException e) {
            return R.error(e.getMessage());
        } catch (AuthenticationException e) {
            return R.error("账户验证失败");
        }

        return R.ok();
    }

    /**
     *
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("login");

        return modelAndView;
    }

    /**
     * 退出
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {
        ShiroUtils.logout();
        return "redirect:login";
    }

}
