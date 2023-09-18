package com.hf.commu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.CommuInfo;
import com.hf.domain.CommuList;
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
	public List<CommuList> getCommuList(){
		return mapper.getCommuList();
	}
	

<<<<<<< HEAD
//	@Override
//	@Autowired
//	public List<Post> getCommuPost(String commuID, SqlSessionTemplate sqlSession) {
//		
//		this.sqlSession = sqlSession;
//		
//		return sqlSession.selectList("com.hf.commu.mapper.CommuMapper.getCommuList", commuID);
//	}

	public List<CommuList> getCommuList1(){
		return mapper.getCommuList();
	}
	
	public void lmake(Gathering gObj) {
		mapper.insertGathering(gObj,"1");
=======
	public void lmake(Gathering gObj, String commuID) {
		log.info("service/lmake");
		mapper.insertGathering(gObj, commuID);
>>>>>>> 3d0313ade25fb0dc1178d41f6c74c605053c4e84
	}

	public List<Gathering> getGathering(String commuID) {
		log.info("service/getGathering");
		return mapper.getGathering(commuID);
	}

	public List<Commumember> getCommumember(String commuID) {
		log.info("service/getCommumember");
		return mapper.getAllCommumember(commuID);
	}

	public List<Post> getCommuPost(String commuID) {
		log.info("service/getCommuPost");
		return mapper.getCommuPost(commuID);
	}

}
