package com.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AccessDeniController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, HttpSession session) {
		log.info("인증: " + auth);
		session.setAttribute("msg", "꺼지셈~~~~");	
	}
	
}
