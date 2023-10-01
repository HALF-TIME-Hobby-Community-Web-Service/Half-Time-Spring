package com.hf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hf.domain.User;
import com.hf.user.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
	public MyPageService service;

	@GetMapping("/mypage")
	public String showMyPage(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		log.info(id);

		if (id != null) {
			return "./jsp/mypage/mypage";// 세션값이 존재하면 마이페이지로 추후 sql문 삽입버전으로 수정필요
		} else {
			return "redirect:user/login";
		}

	}
	
	@PostMapping("/updateInfo")
	public String updateInfo(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		User user = service.getUserInfo(id);
		model.addAttribute("id",id);
		model.addAttribute("nickname",user.getNickname());
		model.addAttribute("pwd",user.getPwd());
		model.addAttribute("name",user.getName());
		model.addAttribute("birth",user.getBirth());
		model.addAttribute("pnum",user.getPnum());
		
		log.info("전화번호 시발 왜안떠"+user.getPnum());
		log.info("여기옴~");
		
		

		return "./jsp/mypage/infoupdate";
	}

	@PostMapping("/updatePassword")
	public String updatePassword(HttpServletRequest request,
	        @RequestParam("pwd_change") String pwd)
	{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		service.updatePassword(pwd, id);
		
		

		return "";
	}
	
	@PostMapping("/updatePhoneNumber")
	public String updatePhoneNumber(HttpServletRequest request,
	        @RequestParam("pnum_change") String pnum)
	{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		service.updatePhoneNumber(pnum, id);
		
		/*
		 * model.addAttribute("id",id); model.addAttribute("",);
		 * model.addAttribute("id",id);
		 */

		return "";
	}

}
