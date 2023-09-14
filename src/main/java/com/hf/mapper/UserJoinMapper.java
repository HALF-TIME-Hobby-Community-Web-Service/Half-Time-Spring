package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserJoinMapper {
    void insertUser(User user);
    void insertUserLocation(@Param("id") String id , @Param("location") String location);
    void insertUserCategory(User user);
    int joinIDcheckpage(String id);
}