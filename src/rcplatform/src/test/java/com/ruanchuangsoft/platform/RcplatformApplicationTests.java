package com.ruanchuangsoft.platform;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.ruanchuangsoft.platform.entity.CheckinmainEntity;
import com.xiaoleilu.hutool.date.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest

public class RcplatformApplicationTests {

	@Test
	public void contextLoads() {
		Date date = DateUtil.parse("2017-08","yy-MM");
		int i = 0;
	}

}
