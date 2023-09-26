package com.hf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.User;
import com.hf.mapper.UserMapper;

import lombok.Setter;

@Service 
public class UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	//가입페이지 1
    public int joinCheck(User user) {
        mapper.insertUser(user);      
        return 1;
    }
    
    //가입페이지 2
    public int joinCheck2 (User user) {
    	mapper.insertUserLocation(user.getId(), user.getLocation());
    	mapper.insertUserCategory(user.getId(),user.getCategory());
    	return 2;
    }
    
    //아이디중복체크 (가입) 
    public int joinIDCheck(String id) {
        return mapper.joinIDcheckpage(id);
    }
    
    //아이디찾기
    public String loginFindIDCheck(String name, String pnum) {
		return mapper.LoginFindID(name, pnum);
	}
    
    //비밀번호찾기
	public String loginFindPWCheck(User user) {
		return mapper.LoginFindPW(user.getId(), user.getName(), user.getGender(), user.getBirth(), user.getPnum());
	}
	
	//아이디존재여부확인 (비밀번호찾기) 
	public String loginfindPW_IDCheck(String id) {
		return mapper.loginfindPW_IDCheck(id); 
	}
	
	//로그인
    public User login(String ID, String PWD) {
		User dto = mapper.userLogin(ID,PWD);
		return dto;
		
	};
	
	// 카카오 가입페이지 1
	public int kakaojoinCheck(User user, String kakaogender) {
		 mapper.insertKakaoUser(user); 
		 if(kakaogender.equals("female")) {
			 user.setGender(1);
			 user.setPwd(user.getId()+"123");
			 return 1;
		 }else if(kakaogender.equals("male")){
			 user.setGender(0);
			 user.setPwd(user.getId()+"123");
			 return 1;
		 }else {
			 return 0;
		 }
	 }
	
	// 카카오 가입페이지 2
    public int kakaojoinCheck2 (User user) { 	
    	mapper.insertkakaoUserLocation(user.getId(), user.getLocation());
    	mapper.insertkakaoUserCategory(user.getId(),user.getCategory());
    	return 2;
    }
    
    // 카카오 아이디 체크 (아이디 가입여부 확인) 
    public boolean kakaoIDCheck(String kakaoID) {
    	String kakaoIDCheck = mapper.kakaoIDCheck(kakaoID);	
    		return kakaoIDCheck!=null;
 	
    }
	
	

}