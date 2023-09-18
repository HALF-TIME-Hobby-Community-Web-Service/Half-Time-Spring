package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hf.moment.service.MomentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {

	int pageNum = 1;
	
	@Setter(onMethod_ = @Autowired)
	private MomentService momentService;

	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", momentService.getMomentsWithContent(pageNum));
		pageNum++;
		return "./jsp/moment/feed";
	}
	
	@GetMapping("/commu")
	public String hello(@RequestParam("commuID") String commuID) {
		log.info("커뮤니티 페이지 드개재");
		
		return "./jsp/community/commupage";
	}

}
