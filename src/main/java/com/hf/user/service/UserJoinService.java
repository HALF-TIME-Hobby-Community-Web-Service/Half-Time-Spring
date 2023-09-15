package com.hf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hf.domain.User;
import com.hf.mapper.UserJoinMapperTest;

import lombok.Setter;

@Service 
public class UserJoinService {

	@Setter(onMethod_ = @Autowired)
	private UserJoinMapperTest mapper;

    public int joinCheck(User user) {
        mapper.insertUser(user);
        mapper.insertUserLocation(user);
        mapper.insertUserCategory(user);
        
        return 1; // 또는 성공 시 반환하는 다른 값을 사용하세요.
    }

    public int joinIDcheckpage(String id) {
        return mapper.joinIDcheckpage(id);
    }
}