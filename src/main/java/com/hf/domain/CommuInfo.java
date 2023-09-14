package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CommuInfo {

	private String commuID;
	private String commuName;
	private String commuIntro;
	private String commuCategory;
	private String commuLocation;
	
	public CommuInfo(String commuID, String commuName, String commuIntro, String commuCategory, String commuLocation) {
		this.commuID = commuID;
		this.commuName = commuName;
		this.commuIntro = commuIntro;
		this.commuCategory = commuCategory;
		this.commuLocation = commuLocation;
	}
	
}
