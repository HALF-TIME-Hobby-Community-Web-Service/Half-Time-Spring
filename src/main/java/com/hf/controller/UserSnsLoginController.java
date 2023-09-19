package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hf.user.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/SNS")
@CrossOrigin

public class UserSnsLoginController {

	@Setter(onMethod_ = @Autowired)
    public UserService service; 

   // 회원가입 페이지 1 
   @GetMapping("/kakao")
    public String getjoinUser() {
	  	System.out.println("가는중");
    	return "./jsp/login/kakao_login";
    	
    }
	
}
