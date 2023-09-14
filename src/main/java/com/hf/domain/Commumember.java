package com.hf.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Commumember {

	private String commuID; 
	private String cNickName;
	private String userID;
	private String cAuth;
	private String memberState;
	private String gender;
	private String birth;	
	
	public Commumember(BigDecimal commuID, String cNickName, String userID, BigDecimal cAuth, BigDecimal memberState,
			BigDecimal gender, Timestamp birth) {		
		this.commuID = commuID.toString();
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAuth = cAuth.toString();
		this.memberState = memberState.toString();
		this.gender = gender.toString();
		this.birth = birth.toString();
	}
	
	public Commumember(BigDecimal commuID, String cNickName, String userID, BigDecimal cAuth, BigDecimal memberState) {		
		this.commuID = commuID.toString();
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAuth = cAuth.toString();
		this.memberState = memberState.toString();		
	}

}

