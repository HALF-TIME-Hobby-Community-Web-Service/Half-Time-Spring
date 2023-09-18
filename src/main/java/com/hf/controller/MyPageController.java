package com.hf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hf.user.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
    public UserService service; 
	
	@GetMapping("/mypage")
	public String showMyPage(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		/*
		 * if(id!=null) { return "redirect:/mypage/mypage"; } else { return
		 * "redirect:/user/login"; }
		 */
		return "./jsp/mypage/mypage";
	}

}
