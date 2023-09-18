package com.hf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/community/*", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
@Log4j
public class CommuListController {
	
	@Setter(onMethod_ =@Autowired)
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
}
