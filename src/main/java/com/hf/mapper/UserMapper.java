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
<<<<<<< HEAD
	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
	String LoginFindPW(@Param("id") String id, @Param("name") String name,
						@Param("gender") int gender, @Param("birth") String birth,
						@Param("pnum") String pnum);
	String loginfindPW_IDCheck(String id);
	
=======

	public void insertUser(User user);
    public void insertUserLocation(@Param("id") String id , @Param("location") String location);
    public void insertUserCategory(@Param("id") String id, @Param("category") String category);

    public int joinIDcheckpage(String id);

	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
	public String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
>>>>>>> 6fe0d743ed308403c7a8c502387e8954af0458b6
}