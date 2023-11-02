package com.koreaIT.demo.controller;



import org.springframework.scheduling.annotation.Scheduled;	
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class testScheduler {

    // 3초 간격으로 반복
//    @Scheduled(cron = "10 * * * * *")
    public void testPrintRepeat() {
        DateTimeFormatter dtf =  DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
        System.out.println("스케쥴러 테스트 " + LocalDateTime.now().format(dtf));
        System.out.println("굿굿굿!");
    }
}