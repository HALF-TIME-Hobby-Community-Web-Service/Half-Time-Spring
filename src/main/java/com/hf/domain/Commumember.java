package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data@Component
public class Commumember {

	private String commuID; 
	private String cNickName;
	private String userID;
	private String cAutho;
	private String memberState;
	private String gender;
	private String birth;
	
	public Commumember(String commuID, String cNickName, String userID, String cAutho, String memberState,
			String gender, String birth) {
		
		this.commuID = commuID;
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAutho = cAutho;
		this.memberState = memberState;
		this.gender = gender;
		this.birth = birth;
	}
	
	public Commumember(String commuID, String cNickName, String userID, String cAutho, String memberState) {
		
		this.commuID = commuID;
		this.cNickName = cNickName;
		this.userID = userID;
		this.cAutho = cAutho;
		this.memberState = memberState;
		
		
	}
}

