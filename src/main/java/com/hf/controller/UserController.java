package com.hf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

public class UserController {
	   @Setter(onMethod_ = @Autowired)
	    public UserService service; 

	    @PostMapping
	    @ResponseBody
	    public int joinUser(
	        @RequestParam("join_ID1") String ida,
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

	        System.out.println("ȸ������:" + " ID:" + id + " PWD:" + pwd +
	                " NAME:" + name + " BIRTH:" + birth +
	                " GENDER:" + gender + " ADDRESS:" + address +
	                " PHONENUM:" + phonenum + " NICKNAME" + nickname);

	        int state = service.joinCheck(user);
	        System.out.println("���� : " + state);
	        
	        return state;
	    }
	    
	    @GetMapping("/login")
	    public String getLogin() {
	    	return "./jsp/login/login";
	    }
	    
	    
	    @PostMapping("/login")
		public String postLogin(@RequestParam("id") String id,@RequestParam("pwd") String pwd, HttpServletRequest request) {

			//HttpSession session = request.getSession();

			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(1800);
			User dto = new User();
			
			dto = service.login(id, pwd);
			
			log.info("�����~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+dto);
			
			if(dto != null) {
				log.info(session.getAttribute("id"));
				log.info(session.getMaxInactiveInterval());
				return "./jsp/moment/feed";
			}
			else {
				return "./jsp/login/login";
			}  
	    
 
	    }
}
