package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hf.commu.service.CommuService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/jsp/community", method = RequestMethod.GET)
@Log4j
public class CommuListController {
	
	@Setter(onMethod_ =@Autowired)
	private CommuService commuService;
	
	@GetMapping("/commulist")
	public void commulist(Model model) {
		model.addAttribute("commulist", commuService.getCommuList());
		
	}
}
