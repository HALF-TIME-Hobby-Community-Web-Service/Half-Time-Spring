package com.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/sample")
public class SampleController2 {

	@GetMapping("/all")
	public void doAll() {
		log.info("안녕");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("멤버");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자");
	}

}
