package com.hf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("commu")
@Log4j
public class TmpController {
	
	@GetMapping("1")
	public String hello(@RequestParam("commuID") String commuID) {
		log.info("而ㅻ�ㅻ땲�떚 �럹�씠吏� �뱶媛쒖옱");
		
		return "./jsp/community/commupage";
	}
}
