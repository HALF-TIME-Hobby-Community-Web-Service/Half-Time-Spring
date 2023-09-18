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

    public int joinCheck(User user) {
        mapper.insertUser(user);
        //mapper.insertUserLocation(user.getId(), user.getLocation());
        //mapper.insertUserCategory(user.getId(),user.getCategory());
        
        return 1; 
    }

    public int joinIDCheck(String id) {
        return mapper.joinIDcheckpage(id);
    }
    
    public User login(String ID, String PWD) {
		User dto = mapper.userLogin(ID,PWD);
		return dto;
		
	};
}