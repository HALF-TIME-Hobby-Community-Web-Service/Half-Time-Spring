package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserMapper {
<<<<<<< HEAD
    void insertUser(User user);
    void insertUserLocation(@Param("id") String id , @Param("location") String location);
    void insertUserCategory(@Param("id") String id, @Param("category") String category);
    int joinIDcheckpage(String id);
=======
	public void insertUser(User user);
    public void insertUserLocation(@Param("id") String id , @Param("location") String location);
    public void insertUserCategory(@Param("id") String id, @Param("category") String category);

    public int joinIDcheckpage(String id);
>>>>>>> 375aa194ab8fe1f5c34dabae2c7ba5b3f2a275ee
	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	public String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
}