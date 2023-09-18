package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserMapper {
	public void insertUser(User user);
    public void insertUserLocation(@Param("id") String id , @Param("location") String location);
    public void insertUserCategory(@Param("id") String id, @Param("category") String category);
<<<<<<< HEAD
    public int joinIDcheckpage(String id);
=======
    int joinIDcheckpage(String id);
>>>>>>> a736a2e97b393ada1aa0eadd075220a5af6c0ff3
	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	public String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
}