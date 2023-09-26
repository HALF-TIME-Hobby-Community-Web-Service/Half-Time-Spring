package com.hf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/hf")
	public String home() {
		return "./jsp/home";
	}


	@GetMapping("/2")
	public String clist() {
		return "./jsp/community/commulist";
	}
	

	@GetMapping("/commulist")
	public String commuList() {
		return "./jsp/community/commulist";
	}
	
	
	@GetMapping("/commupage")
	public String commuPage(@RequestParam String commuID, Model model) {
		log.info("commuID: " + commuID);
		
		model.addAttribute("commuID", commuID);
		
		return "./jsp/community/commupage";
	}
	
	
    @GetMapping("/getSession")
    @ResponseBody
    public String getSession(HttpServletRequest request) throws Exception{
    	
    	
    	
    	HttpSession session = request.getSession();
    	String sessionValue = (String)session.getAttribute("id");
    	log.info(sessionValue);
    	return sessionValue;        
    	
    }
	
}
