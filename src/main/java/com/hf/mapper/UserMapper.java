package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserMapper {

<<<<<<< HEAD
	public void insertUser(User user);
    public void insertUserLocation(@Param("id") String id , @Param("location") String location);
    public void insertUserCategory(@Param("id") String id, @Param("category") String category);

    public int joinIDcheckpage(String id);

	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	public String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
=======
    void insertUser(User user);
    void insertUserLocation(@Param("id") String id , @Param("location") String location);
    void insertUserCategory(@Param("id") String id, @Param("category") String category);
    int joinIDcheckpage(String id);

	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
	String LoginFindPW(@Param("id") String id, @Param("name") String name,
						@Param("gender") int gender, @Param("birth") String birth,
						@Param("pnum") String pnum);
	String loginfindPW_IDCheck(String id);
	
>>>>>>> 2627baef609c529c3d284743ee64936d96a3c0f0

}