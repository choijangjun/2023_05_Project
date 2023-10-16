package com.koreaIT.demo;
import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.koreaIT.demo.controller.testScheduler;

@SpringBootApplication
@EnableScheduling
public class DemoApplication {
	

	public static void main(String[] args) {
		
		SpringApplication.run(DemoApplication.class, args);
		SpringApplication.run(testScheduler.class, args);
	}

}
