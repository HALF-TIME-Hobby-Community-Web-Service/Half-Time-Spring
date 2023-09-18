package com.hf.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.domain.User;
import com.hf.user.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
@CrossOrigin

public class UserController {
	   @Setter(onMethod_ = @Autowired)
	    public UserService service; 

	   // 회원가입 페이지 1 
	   @GetMapping("/join1")
	    public String getjoinUser() {
	    	return "./jsp/register/join";
	    }
	   
	    @PostMapping("/join1")
	    @ResponseBody
	    public int joinUser(
	        @RequestParam("join_ID") String ida,
	        @RequestParam("join_ID2") String idb,
	        @RequestParam("join_PW") String pwd,
	        @RequestParam("join_name") String name,
	        @RequestParam("join_birth") String birth,
	        @RequestParam("join_gender") int gender,
	        @RequestParam("join_address") String address,
	        @RequestParam("join_pnum1") String phonenuma,
	        @RequestParam("join_pnum2") String phonenumb,
	        @RequestParam("join_pnum3") String phonenumc,
	        @RequestParam("join_nickname") String nickname
	    
	       
	    ) {
	        String id = ida + idb;
	        String phonenum = phonenuma + phonenumb + phonenumc;     
	        
	        User user = new User(id, pwd, name, birth, gender, address, phonenum, nickname);

	        System.out.println("회원가입정보" + " ID:" + id + " PWD:" + pwd +
	                " NAME:" + name + " BIRTH:" + birth +
	                " GENDER:" + gender + " ADDRESS:" + address +
	                " PHONENUM:" + phonenum + " NICKNAME" + nickname);

	        int state = service.joinCheck(user);
	        System.out.println("가입 : " + state + "페이지작성완료");
	        
	        return state;
	    }
	    
	    //회원가입 페이지2
		  @GetMapping("/join2")
		  public String getjoinUser2() {
			  return "./jsp/register/join2";
		    }
		  
		 @PostMapping("/join2")
		 @ResponseBody
		    public int joinUser2(
		        @RequestParam("location") String location,
		        @RequestParam("category") String category,
		        @RequestParam("userid") String id
		    ) {
			
			 	System.out.println(id + "회원의 관심지역: " + location + "과 관심사: " + category);
		        User user = new User(location, category, id);


		        int state = service.joinCheck2(user);
		        System.out.println("가입 " + state + "페이지 작성 완료");

		        return state;
		    }
		  
		  
	    //로그인 페이지
	    @GetMapping("/login")
	    public String getLogin() {
	    	return "./jsp/login/login";
	    }
	    
	    @ResponseBody
	    @PostMapping("/login")
		public Map<String,Object> postLogin(@RequestParam("id") String id,@RequestParam("pwd") String pwd, HttpServletRequest request) {

			//HttpSession session = request.getSession();
	    	Map<String,Object> result = new HashMap<String, Object>();
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(1800);
			User dto = new User();
			
			dto = service.login(id, pwd);
			
			log.info("결과는~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+dto);
			
			if(dto != null) {
				log.info(session.getAttribute("id"));
				log.info(session.getMaxInactiveInterval());
				
				result.put("result", true);
			}else {
				result.put("result", false);	
			}

		    return result;			
	    }
	
	    // 아이디 찾기
	    @GetMapping("/findid")
	    public String getFindId() {
	    	return "./jsp/login/login_findID";
	    }
	    
	    @PostMapping("/findid")
		 @ResponseBody
		    public String postFindId(
		        @RequestParam("findIDName") String name,
		        @RequestParam("findIDPnum1") String pnum1,
		        @RequestParam("findIDPnum2") String pnum2,
		        @RequestParam("findIDPnum3") String pnum3
		    ) {
			
	    		String pnum = pnum1+pnum2+pnum3;
	    		System.out.println("이름: "+name+" 핸드폰 번호: "+pnum+"님의 아이디 찾기를 진행하고 있습니다");
	    		String findID = service.loginFindIDCheck(name, pnum);
	    		
	
	    		if (findID != null) {
	    			System.out.println("유저의 아이디는 [" + findID+ "] 입니다");
	    		}else {
	    			System.out.println("회원가입 이력이 없습니다");
	    		}
	    		
	    		return findID;

		        
		    }
	    
	    // 비밀번호 찾기
	    @GetMapping("/findpw")
	    public String getFindPw() {
	    	return "./jsp/login/login_findPW";
	    }
	    
	    @PostMapping("/findpw")
		 @ResponseBody
		    public String postFindId(
		        @RequestParam("findPWID") String id,
		        @RequestParam("findPWName") String name,
		        @RequestParam("findPWGender") int gender,
		        @RequestParam("findPWBirth") String birth,
		        @RequestParam("findPWPnum1") String pnum1,
		        @RequestParam("findPWPnum2") String pnum2,
		        @RequestParam("findPWPnum3") String pnum3
		    ) {
			
		    
	    		String pnum = pnum1+pnum2+pnum3;
	    		System.out.println("비밀번호 찾기 진행중입니다");
	    		System.out.println(id+"회원님의 정보는 아래와 같습니다");
	    		System.out.println("이름: "+name+" / "+"성별: "+gender+" / "+"생년월일: "+birth+" / "+"핸드폰번호: "+pnum);
	    		
	    	
	    		
	    		User user = new User(id, name, gender, birth, pnum);
	    		String findPW = service.loginFindPWCheck(user);
	    		
	    		//String findPW = service.loginFindPWCheck(id, name, gender, birth, pnum);
	    	
	    		
	
	    		if (findPW!= null) {
	    			System.out.println("회원님의 비밀번호는 [" + findPW+ "] 입니다");
	    		}else {
	    			System.out.println("회원가입 이력이 없습니다");
	    		}
	    		
	    		return findPW;

		        
		    }
	    
	    
	    @PostMapping("/findpwid")
	    @ResponseBody
	    public String loginfindPW_IDCheck(
	    		@RequestParam("findPWID") String id) {
	        System.out.println("회원아이디: " + id + "가 유효한지 확인하고 있습니다");

	        String idCheck = service.loginfindPW_IDCheck(id);
	     
			if(idCheck!=null) {
				System.out.println("존재하는 아이디입니다");
				
			}else {
				System.out.println("존재하는 아이디가아닙니다.");
				
			}
	        
			System.out.println("보내지는 것: "+idCheck);
	        return idCheck;
	    }
	    
}
