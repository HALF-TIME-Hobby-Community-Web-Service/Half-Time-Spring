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
	
	private String locationName;
	private String categoryName;
	
	private String locationtag;
	
	

	//�뜮袁⑨옙甕곕뜇�깈 筌≪뼐由� 占쎄문占쎄쉐占쎌쁽
	public User(String id, String name, int gender, String birth, String pnum) {
		this.id=id;
		this.name=name;
		this.gender=gender;
		this.birth=birth;
		this.pnum=pnum;
	}
	public User() {
	
	}
	//嚥≪뮄�젃占쎌뵥 占쎄문占쎄쉐占쎌쁽
	public User(String id, String pwd){
		this.id=id;
		this.pwd=pwd;		
	}
	
	
	
	//占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎈읂占쎌뵠筌욑옙1 占쎄문占쎄쉐占쎌쁽
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

	//占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎈읂占쎌뵠筌욑옙2 占쎄문占쎄쉐占쎌쁽
	public User(String location, String category, String id, String locationtag) {
		this.location = location;
		this.category = category;
		this.id=id;
		this.locationtag = locationtag;
	}
	
	public User(String location, String category, String id) {
		this.location = location;
		this.category = category;
		this.id=id;
	}
	
	//占쎈툡占쎌뵠占쎈탵 餓λ쵎�궗筌ｋ똾寃�
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
	public User(String id, String pwd, String name, String birth, int gender, String address, String pnum, String nickname,String categoryName, String locationName){
		this.id = id;
		this.pwd = pwd;
		this.name = name; 
		this.birth = birth; 
		this.gender = gender;
		this.address = address; 
		this.pnum = pnum; 
		this.nickname = nickname;
		this.categoryName=categoryName;
		this.locationName=locationName;
	}

	

}
