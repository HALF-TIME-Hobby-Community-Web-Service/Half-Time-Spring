package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserMapper {
    void insertUser(User user);
    void insertUserLocation(@Param("id") String id , @Param("location") String location);
    void insertUserCategory(@Param("id") String id, @Param("category") String category);
    int joinIDcheckpage(String id);
	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
<<<<<<< HEAD
	String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
=======
	

>>>>>>> b45b4bfe428e04d38cd4ecb34b0cebdcad85ad5f
}