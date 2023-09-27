package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface MyPageMapper {
	public void deleteUserInfo();
	public void updatePassword(@Param("id")String id,@Param("pwd") String pwd);
	public void updatePhoneNumber(@Param("id")String id, @Param("pnum") String pNum);
}
