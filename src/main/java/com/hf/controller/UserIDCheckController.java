package com.hf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hf.user.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/user/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
@Log4j
public class UserIDCheckController {

	   @Setter(onMethod_ = @Autowired)
	    public UserService service; 
	
	    
	    //아이디 중복확인	    
	    @PostMapping("/idcheck")
	    @ResponseBody
	    public int checkUserId(
	        String ida,
	        String idb
	    ) {
	        String idcheck = ida + idb;
	        //System.out.println(idcheck);
	        log.info(idcheck);
	        
	        int state = service.joinIDCheck(idcheck);
	        System.out.println("state: " + state);
	        return state;
	    }
    
}
