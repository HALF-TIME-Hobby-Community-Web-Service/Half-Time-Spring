package com.hf.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuConst;
import com.hf.domain.CommuInfo;
import com.hf.domain.Commumember;
import com.hf.domain.Gathering;
import com.hf.domain.Post;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
//@Controller
@RequestMapping(value = "/commu/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
@Log4j
public class CommuController {

	@Setter(onMethod_ = @Autowired)
	private CommuService service;
	

	@PostMapping("/getmember")
	public List<Commumember> getCommumemberList(@RequestParam("commuID") String commuID) {
		log.info("commu/getMember/commuID: " + commuID);
		List<Commumember> cList = service.getCommumember(commuID);		
		log.info(cList);
		return cList;
	}


	@GetMapping("/getpost")
	public List<Post> getBoard(@RequestParam("commuID") String commuID) {
		List<Post> boardList = service.getCommuPost(commuID);
		return boardList;
	}


	@GetMapping("/getcommuinfo")
	public CommuInfo getCommuInfo(@RequestParam("commuID") String commuID) {
		log.info("|commuInfo| commuID: " + commuID);
		CommuInfo commuInfo = service.getCommuInfo(commuID);
		log.info("commuInfo: " + commuInfo);
		return commuInfo;
	}


	@PostMapping("/lget")
	public List<Gathering> getGathering(String commuID) {
		log.info("lget: " + commuID);
		List<Gathering> gatheringList = service.getGathering(commuID);
		log.info(gatheringList);
		return gatheringList;
	}
	
	
	@PostMapping("/lmake")
	public String lmake(
			@RequestParam String title,
			@RequestParam String startTime,
			@RequestParam String endTime,
			@RequestParam String location,
			@RequestParam String text,
			@RequestParam String capacity,
			@RequestParam String price,
			@RequestParam String commuID) {			
				
		log.info(commuID);
	
		Gathering g = new Gathering(title, text, commuID, "코스타남신김수열", startTime, endTime, new BigDecimal(price.split("원")[0]), location, new BigDecimal(capacity.split("명")[0]));
		log.info("Gathering: " + g);	        
		service.lmake(g);
		return "1";	
	}
	
	
	@PostMapping("/const")
	public CommuConst getcommuConst(@RequestParam String commuID) {						
		log.info("commu/const/commuID: " + commuID);
	        
		CommuConst cc = service.getConst(commuID);
		log.info("cc: " + cc);
		return cc;	
	}
	
	
}