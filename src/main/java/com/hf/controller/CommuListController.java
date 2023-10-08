package com.hf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/community/*", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
@Log4j
public class CommuListController {
	
	@Setter(onMethod_ = @Autowired)
	private CommuService commuService;
	

	@GetMapping("/getlist")
	public List<CommuInfo> commulist() {		
		List<CommuInfo> clist = commuService.getCommuList();
		log.info(clist);
		return clist;
	}
		
	@PostMapping("/commuhome")
	public void commuHome(Model model, String commuID) {
	}
	
	@GetMapping("/commulist")
	public void commulist(Model model) {
		model.addAttribute("commulist", commuService.getCommuList());		
	}
	
	@PostMapping("/checkmember")
	public String checkmember(@RequestParam("commuID") String commuID, @RequestParam("nickname") String nickname) {
		String result = commuService.checkmember(commuID, nickname);
		log.info("checkmember/result: " + result);
		return result;
	}
	
	@PostMapping("/cjoin")
	public String cjoin(HttpServletRequest request, @RequestParam("commuID") String commuID, @RequestParam("nickname") String nickname) {		
		HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("id");
        
        String result = commuService.cjoin(commuID, nickname, userID);
        log.info("/cjoin/result: " + result );
        
		return result;
	}
	
	@PostMapping("check_joined")
	public String checkJoined(HttpServletRequest request, @RequestParam("commuID") String commuID) {
		HttpSession session = request.getSession();
		try {
	        String userID = (String) session.getAttribute("id");
	        if (userID == null)
	        	return "NOTYET";
	        
	        String result = commuService.checkJoined(commuID, userID);
	        log.info("checkJoined/result: " + result );
	        
	        return result;
		}
		catch (NullPointerException e) {
			log.info("Check_joined: NPE발생");
			return "";
		}
    }
}
