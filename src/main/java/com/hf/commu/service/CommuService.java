package com.hf.commu.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.CommuConst;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuWithContent;
import com.hf.domain.Commumember;
import com.hf.domain.Gathering;
import com.hf.domain.Post;
import com.hf.domain.commuSerise;
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
		log.info("여기~~~~~~~~~~~~~~요~~~~~~~~~~~~~~");
		return mapper.getCommuListByLocation(location);
	}
	public List<CommuInfo> getCommuListById(String id){
		log.info("여기~~~~~~~~~~~~~~요~~~~~~~~~~~~~~");
		return mapper.selectCommuById(id);
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
			log.info("service/join�뿉�윭" + returnMSG);
		} 
		return returnMSG;		
	}

	public List<CommuInfo> getCommuList1(){
		return mapper.getCommuList();
	}
	
	public void lmake(Gathering g) {
		mapper.insertGathering(g);
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
	
	public List<Post> getHistory(String commuID) {
		log.info("service/getHistory");
		return mapper.getHistory(commuID);
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
	
	public String cmake(commuSerise c) {
		try {				
			/* �젙�썝 */
			if (c.getCapacity() == null)
				c.setCapacity(BigDecimal.valueOf(50));
			else if (c.getCapacity().compareTo(BigDecimal.valueOf(0)) <= 0)					
				c.setCapacity(BigDecimal.valueOf(50));
				
			/* �굹�씠�젣�븳 */
			if(c.getAgelimitmin()==null)
				c.setAgelimitmin(BigDecimal.valueOf(0));
			if(c.getAgelimitmax()==null)
				c.setAgelimitmax(BigDecimal.valueOf(0));
			
			/* �꽦蹂꾩젣�븳 */
			BigDecimal gender;
			if (c.getGender().equals("all")) 
				gender = BigDecimal.valueOf(0);
			else if (c.getGender().equals("man")) 
				gender = BigDecimal.valueOf(1);
			else
				gender = BigDecimal.valueOf(2);						
			
			/* �떆���뒪 諛쏄린 */
			long seq = mapper.selectCommuSeq();			
			log.info("seq: " + seq);
			c.setCommuID(BigDecimal.valueOf(seq));			
			
			log.info("commu�깮�꽦1 " + mapper.insertCommu(c));
			log.info("commu�깮�꽦2 " + mapper.insertCommuConst(c, gender));
			log.info("commu�깮�꽦3 " + mapper.insertCommuManager(c));
			
			return "success";
		} catch(Exception e) {
			return "error";
		}
	}
	
	
	public void commuUpload(CommuWithContent cwc){
    	log.warn(cwc.getWRITER());
    	log.warn(cwc.getTEXT());
    	log.warn(cwc.getPOSTTYPE());
    	mapper.modalUpload(cwc);
    } 
	public void fileUpload(CommuWithContent cwc) {
    	mapper.fileUpload(cwc);	
    }
	
	public int getMaxCommuID() {
    	return mapper.getMaxCommuID();
    }
	
	
	//2023-10-08 추가
	public String checkmember(String commuID, String nickname) {
		try {
			if (mapper.checkmember(commuID, nickname) >= 1)
				return "duplicated";
			else
				return "OK";
		} catch(NullPointerException e) {
			return "ERROR";
		}
	}
	
	public String cjoin(String commuID, String nickname, String userID) {
		try {
			mapper.cjoin(commuID, nickname, userID);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}
	
	public String checkJoined(String commuID, String userID) {		
		int result = mapper.checkJoined(commuID, userID);
		if (result >= 1) 
			return "JOINED";
		return "NOTYET";				
	}
	
	public String getMember(String commuID, String userID) {
		return mapper.getMember(commuID, userID);		
	}

}
