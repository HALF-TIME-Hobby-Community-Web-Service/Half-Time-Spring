package com.hf.commu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.CommuConst;
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
	public List<CommuInfo> getCommuList(){
		return mapper.getCommuList();
	}
	public List<CommuInfo> getCommuListByLocation(String location){
		return mapper.getCommuListByLocation(location);
	}
	
	public String join(String commuID, String userID, String nickname) {
		
		log.info("service/join/commuID: " + commuID);
		
		String returnMSG = "fail";
		try {
			if (mapper.join(commuID, userID, nickname) >= 1)
				returnMSG = "success";
			log.info("service/join: " + returnMSG);
		}
		catch (Exception e) {
			log.info("service/join에러" + returnMSG);
		} 
		return returnMSG;		
	}

	public List<CommuInfo> getCommuList1(){
		return mapper.getCommuList();
	}
	
	public void lmake(Gathering gObj) {
		mapper.insertGathering(gObj,"1");
	}
	public void lmake(Gathering gObj, String commuID) {
		log.info("service/lmake");
		mapper.insertGathering(gObj, commuID);

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
	
	public CommuConst getConst(String commuID) {
		log.info("service/getCommuConst");
		return mapper.getCommuConst(commuID);
	}
	
	public String checkCommuName(String commuName) {		
		try {
			if (mapper.selectCommuName(commuName) >= 1)
			    return "fail";
			return "success";
		} catch(Exception e) {
			return "error";
		}
	}

}
