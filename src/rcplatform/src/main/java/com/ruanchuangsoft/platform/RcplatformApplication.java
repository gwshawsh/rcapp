package com.ruanchuangsoft.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class RcplatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(RcplatformApplication.class, args);
	}
}
