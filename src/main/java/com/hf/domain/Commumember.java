package com.hf.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Component
public class Commumember {

	private String commuID; 
	private String cNickName;
	private String userID;
	private String cAuth;
	private String gender;
	private String birth;	
	
	public Commumember(BigDecimal commuID, String cNickName, String userID, BigDecimal cAuth, BigDecimal gender, Timestamp birth) {		
		this.commuID = commuID.toString();
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAuth = cAuth.toString();
		this.gender = gender.toString();
		this.birth = birth.toString();
	}
	
	public Commumember(BigDecimal commuID, String cNickName, String userID, BigDecimal cAuth) {		
		this.commuID = commuID.toString();
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAuth = cAuth.toString();		
	}

}

