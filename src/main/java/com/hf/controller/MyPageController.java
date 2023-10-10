package com.hf.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;
import com.hf.domain.User;
import com.hf.user.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class MyPageController {
	@Setter(onMethod_ = @Autowired)
	public MyPageService service;
	
	@Setter(onMethod_ = @Autowired)
	public CommuService commuservice;

	@PostMapping("/mypage")
	public String showMyPage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		User user = service.getUserInfo(id);
		model.addAttribute("id", id);
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("pwd", user.getPwd());
		model.addAttribute("name", user.getName());
		
		model.addAttribute("pnum", user.getPnum());
		model.addAttribute("address", user.getAddress());
		if(user.getGender()==1) {
			model.addAttribute("gender", "남");
			}else {
			model.addAttribute("gender", "여");
			}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birth = null;
        try {
            birth = dateFormat.parse(user.getBirth());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        Date currentDate = new Date();

        // Calendar 揶쏆빘猿쒐몴占� 占쎄텢占쎌뒠占쎈릭占쎈연 占쎄돌占쎌뵠 �④쑴沅�
        Calendar dobCalendar = Calendar.getInstance();
        dobCalendar.setTime(birth);
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.setTime(currentDate);

        int age = currentCalendar.get(Calendar.YEAR) - dobCalendar.get(Calendar.YEAR);

        if (currentCalendar.get(Calendar.DAY_OF_YEAR) < dobCalendar.get(Calendar.DAY_OF_YEAR)) {
            age--;
        }
        model.addAttribute("birth", age);
      
        
        
        List<CommuInfo> ci = commuservice.getCommuListById(id);
        model.addAttribute("commu", ci);
        
		if (id.equals(user.getId())) {
			return "./jsp/mypage/mypage";
		} else {
			return "redirect:user/login";
		}

	}
	
	
	
	@PostMapping("/userpage")
	public String showUserPage(@RequestParam("value") String id, Model model) {


		User user = service.getUserInfo(id);
		model.addAttribute("id", id);
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("pwd", user.getPwd());
		model.addAttribute("name", user.getName());
		
		model.addAttribute("pnum", user.getPnum());
		model.addAttribute("address", user.getAddress());
		if(user.getGender()==1) {
			model.addAttribute("gender", "남");
			}else {
			model.addAttribute("gender", "여");
			}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birth = null;
        try {
            birth = dateFormat.parse(user.getBirth());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        Date currentDate = new Date();

        // Calendar 揶쏆빘猿쒐몴占� 占쎄텢占쎌뒠占쎈릭占쎈연 占쎄돌占쎌뵠 �④쑴沅�
        Calendar dobCalendar = Calendar.getInstance();
        dobCalendar.setTime(birth);
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.setTime(currentDate);

        int age = currentCalendar.get(Calendar.YEAR) - dobCalendar.get(Calendar.YEAR);

        if (currentCalendar.get(Calendar.DAY_OF_YEAR) < dobCalendar.get(Calendar.DAY_OF_YEAR)) {
            age--;
        }
        model.addAttribute("birth", age);
      
        
        
        List<CommuInfo> ci = commuservice.getCommuListById(id);
        model.addAttribute("commu", ci);
       
			return "./jsp/mypage/userpage";

	}

	
	@PostMapping("/updateInfo")
	public String updateInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		User user = service.getUserInfo(id);
		model.addAttribute("id", id);
		model.addAttribute("nickname", user.getNickname());
		model.addAttribute("pwd", user.getPwd());
		model.addAttribute("name", user.getName());
		model.addAttribute("birth", user.getBirth());
		model.addAttribute("pnum", user.getPnum());


		log.info("�뜝�룞�삕�뜝�룞�삕�뜝占�~");

		return "./jsp/mypage/infoupdate";
	}

	@ResponseBody
	@PostMapping(value = "/updatePassword", produces = "application/json")
	public int updatePassword(HttpServletRequest request, @RequestParam("pw_update") String pwd) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = service.updatePassword(id, pwd);
		return result;
	}


	@ResponseBody
	@PostMapping(value = "/updatePhoneNumber", produces = "application/json")
	public int updatePhoneNumber(HttpServletRequest request, @RequestParam("pnum_update") String pnum) {
		log.info("�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕~" + pnum);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = service.updatePhoneNumber(id,pnum);
		return result;

	}

}
