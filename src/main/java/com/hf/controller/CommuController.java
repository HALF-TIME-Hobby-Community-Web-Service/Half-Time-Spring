package com.hf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuList;
import com.hf.domain.Commumember;
import com.hf.domain.Criteria;
import com.hf.domain.Gathering;
import com.hf.domain.Post;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/commu/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
@Log4j
public class CommuController {

	@Setter(onMethod_ = @Autowired)
	private CommuService service;

	@ResponseBody
	@GetMapping("/member")
	public List<Commumember> getCommumemberList() {
		List<Commumember> cList = service.getCommumember();
		return cList;
	}

	@ResponseBody
	@GetMapping("/board")
	public List<Post> getBoard(@RequestParam("commuID") String commuID) {

		List<Post> boardList = service.getCommuPost(commuID);

		return boardList;
	}

	@ResponseBody
	@GetMapping("/info")
	public CommuInfo getCommuInfo(@RequestParam("commuID") String commuID) {
		CommuInfo commuInfo = service.getCommuInfo(commuID);

		return commuInfo;
	}

	@ResponseBody
	@GetMapping("/lget")
	public List<Gathering> getGathering() {

		List<Gathering> gatheringList = service.getGathering();

		return gatheringList;
	}

	@ResponseBody
	@GetMapping("/lmake")
	public String lmake(@RequestParam("title") String title, @RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime, @RequestParam("check") String check,
			@RequestParam("location") String location, @RequestParam("text") String text,
			@RequestParam("capacity") int capacity, @RequestParam("price") int price) {

		log.info("제목: " + title);
		log.info("시작 시간: " + startTime);
		log.info("종료 시간: " + endTime);
		log.info("체크박스: " + check);
		log.info("지역: " + location);
		log.info("내용: " + text);
		log.info("정원: " + capacity);
		log.info("회비: " + price);

		service.lmake(new Gathering(title, startTime, endTime, location, text, price, capacity));

		return "1";
	}
}