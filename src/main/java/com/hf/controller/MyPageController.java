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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@PostMapping("/mypage")
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
	public String updateInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		User user = service.getUserInfo(id);
		model.addAttribute("id", id);
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("pwd", user.getPwd());
		model.addAttribute("name", user.getName());
		model.addAttribute("birth", user.getBirth());
		model.addAttribute("pnum", user.getPnum());

		log.info("여기옴~");

		return "./jsp/mypage/infoupdate";
	}

	@ResponseBody
	@PostMapping(value = "/updatePassword", produces = "application/json")
	public int updatePassword(HttpServletRequest request, @RequestParam("pw_update") String pwd) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = service.updatePassword(id, pwd);
		return result;
	}


	@ResponseBody
	@PostMapping(value = "/updatePhoneNumber", produces = "application/json")
	public int updatePhoneNumber(HttpServletRequest request, @RequestParam("pnum_update") String pnum) {
		log.info("여기옴 전번수정~" + pnum);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = service.updatePhoneNumber(id,pnum);
		return result;

	}

}
