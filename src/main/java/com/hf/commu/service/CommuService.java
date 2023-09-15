package com.hf.commu.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.CommuInfo;
import com.hf.domain.Commumember;
import com.hf.domain.Gathering;
import com.hf.domain.Post;
import com.hf.mapper.CommuMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommuService {

	@Setter(onMethod_ = @Autowired)
	private CommuMapper mapper;

	public CommuInfo getCommuInfo(String commuID) {
		log.info("service/getCommuInfo");
		return mapper.getCommuInfo(commuID);
	}

	public void lmake(Gathering gObj) {
		log.info("service/lmake");
		mapper.insertGathering(gObj,"1");
	}

	public List<Gathering> getGathering() {
		log.info("service/getGathering");
		return mapper.getGathering("1");
	}

	public List<Commumember> getCommumember() {
		log.info("service/getCommumember");
		return mapper.getAllCommumember("1");
	}

	public List<Post> getCommuPost(String commuID) {
		log.info("service/getCommuPost");
		return mapper.getCommuPost(commuID);
	}

}
