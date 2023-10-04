package com.hf.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hf.domain.User;

@Component
public interface UserMapper {
		
    	public void insertUser(User user);
    	public void insertUserLocation(@Param("id") String id , @Param("location") String location);
    	public void insertUserCategory(@Param("id") String id, @Param("category") String category);
    	public int joinIDcheckpage(String id);
    	public User userLogin(@Param("ID") String ID, @Param("PWD")String PWD);
    	
		public String LoginFindID(@Param("name") String name, @Param("pnum") String pnum);
		public String LoginFindPW(@Param("id") String id, @Param("name") String name,
						@Param("gender") int gender, @Param("birth") String birth,
						@Param("pnum") String pnum);
		public String loginfindPW_IDCheck(String id);
		//카카오
		public void insertKakaoUser(User user);
		public void insertkakaoUserLocation(@Param("id") String id , @Param("location") String location);
		public void insertkakaoUserCategory(@Param("id") String id, @Param("category") String category);
		public String kakaoIDCheck(String kakaoID);
		//네이버
		public void insertNaverUser(User user);
		public void insertnaverUserLocation(@Param("id") String id , @Param("location") String location);
		public void insertnaverUserCategory(@Param("id") String id, @Param("category") String category);
	

}