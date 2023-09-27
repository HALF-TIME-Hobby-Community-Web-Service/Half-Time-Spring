package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data@Component@AllArgsConstructor
public class User {
	private String id;
	private String idch;
	private String pwd;
	private String nickname;
	private String pwdch; 
	private String name; 
	private String birth; 
	private int gender; 

	private String address; 
	private String pnum;
	private String location; 
	private String category; 
	private String profileImg;
	

	//鍮꾨�踰덊샇 李얘린 �깮�꽦�옄
	public User(String id, String name, int gender, String birth, String pnum) {
		this.id=id;
		this.name=name;
		this.gender=gender;
		this.birth=birth;
		this.pnum=pnum;
	}
	public User() {
	
	}
	//濡쒓렇�씤 �깮�꽦�옄
	public User(String id, String pwd){
		this.id=id;
		this.pwd=pwd;		
	}
	
	//�쉶�썝媛��엯 �럹�씠吏�1 �깮�꽦�옄
	public User(String id, String pwd, String name, String birth, int gender, String address, String pnum, String nickname){
		this.id = id;
		this.pwd = pwd;
		this.name = name; 
		this.birth = birth; 
		this.gender = gender;
		this.address = address; 
		this.pnum = pnum; 
		this.nickname = nickname;				
	}

	//�쉶�썝媛��엯 �럹�씠吏�2 �깮�꽦�옄
	public User(String location, String category, String id) {
		this.location = location;
		this.category = category;
		this.id=id;
	}
	
	//�븘�씠�뵒 以묐났泥댄겕
	public User(String id) {
		this.id = id;
	}
	
	public User(String id, String pwd, String nickname, String name, String birth, int gender, String address,
			String pnum, String profileImg) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.pnum = pnum;
		this.address = address;
		this.profileImg = profileImg;
		
	}
	public User(String id, String pwd, String nickname, String name, String birth, int gender, String address,
			String pnum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.pnum = pnum;
	}
	public User(String id, String nickname, String name, String birth, int gender, String address, String pnum) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.pnum = pnum;
	}

	

}
