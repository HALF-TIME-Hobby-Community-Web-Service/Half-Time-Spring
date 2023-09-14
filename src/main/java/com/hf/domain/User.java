package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data@Component
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
	

	//비밀번호 찾기 생성자
	public User(String id, String name, int gender, String birth, String pnum) {
		this.id=id;
		this.name=name;
		this.gender=gender;
		this.birth=birth;
		this.pnum=pnum;
	}
	public User() {
	
	}
	//로그인 생성자
	public User(String id, String pwd){
		this.id=id;
		this.pwd=pwd;		
	}
	
	//회원가입 페이지1 생성자
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

	//회원가입 페이지2 생성자
	public User(String location, String category, String id) {
		this.location = location;
		this.category = category;
		this.id=id;
	}
	
	//아이디 중복체크
	public User(String id) {
		this.id = id;
	}

}
