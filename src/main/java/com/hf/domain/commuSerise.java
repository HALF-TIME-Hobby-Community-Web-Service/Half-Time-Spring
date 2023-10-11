package com.hf.domain;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@Component
@AllArgsConstructor
@ToString
public class commuSerise {		
	private String communame;		
	private String commuintro;		
	private String commucategory;	
	private String commulocation;	
	private BigDecimal capacity;	
	private BigDecimal agelimitmin;	
	private BigDecimal agelimitmax;	
	private String gender;		
	private String cnickname;	
	private BigDecimal commuID;
	private String userID;
	private MultipartFile file;
}
