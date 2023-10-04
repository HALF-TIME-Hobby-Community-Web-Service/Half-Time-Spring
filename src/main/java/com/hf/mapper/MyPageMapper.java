package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface MyPageMapper {
	public void deleteUserInfo();
	public int updatePassword(@Param("id")String id,@Param("pwd") String pwd);
	public int updatePhoneNumber(@Param("id")String id, @Param("pnum") String pNum);
	public User getUserInfo(@Param("id")String id);
}
