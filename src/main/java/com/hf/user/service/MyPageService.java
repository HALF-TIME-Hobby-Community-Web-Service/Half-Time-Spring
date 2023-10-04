package com.hf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.User;
import com.hf.mapper.MyPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service 
public class MyPageService {

	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;
	
	 public User getUserInfo(String id ) {
   	User user = mapper.getUserInfo(id);
   	  return user;

   }

    public int updatePassword(String id,  String pwd) {

	    int i = mapper.updatePassword(id,pwd);

	    return i;
    }
    
    public int updatePhoneNumber(String id, String pNum) {
    	int i = mapper.updatePhoneNumber(id,pNum);
    	return i;
    	
    	
    }

}