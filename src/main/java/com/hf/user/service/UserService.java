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
        mapper.insertUserLocation(user.getId(), user.getLocation());
        mapper.insertUserCategory(user);
        
        return 1; 
    }

    public int joinIDcheckpage(String id) {
        return mapper.joinIDcheckpage(id);
    }
}