package com.hf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.User;
import com.hf.mapper.MyPageMapper;

import lombok.Setter;

@Service 
public class MyPageService {

	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;
	
	 public User getUserInfo(String id ) {
   	User user = mapper.getUserInfo(id);
   	  return user;

   }

    public int updatePassword(String pwd,  String id) {
    	  mapper.updatePassword(pwd, id);
    	  return 1;

    }
    public int updatePhoneNumber(String pNum, String id) {
    	mapper.updatePhoneNumber(pNum, id);
    	return 1;
    	
    }

}