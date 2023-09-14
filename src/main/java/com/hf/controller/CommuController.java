package com.hf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hf.commu.service.CommuService;
import com.hf.domain.CommuInfo;
import com.hf.domain.CommuList;
import com.hf.domain.Commumember;
import com.hf.domain.Criteria;
import com.hf.domain.Gathering;
import com.hf.domain.Post;

import lombok.Setter;

@CrossOrigin("*")
@Controller
@RequestMapping(value = "/commu/*", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
public class CommuController {
	
    @Setter(onMethod_ = @Autowired)
    private CommuService service;
   
    @ResponseBody
    @GetMapping("/list")
    public List<CommuList> getCommuList(Criteria cri) {
        return service.getCommuList(cri);
    }
    
    @ResponseBody
    @GetMapping("/member")
    public List<Commumember> getCommumemberList() {
        List<Commumember> cList = service.getCommumember();
        return cList;
    }
    
    
    @ResponseBody
    @GetMapping("/board")
    public List<Post> getBoard(@RequestParam("commuID") String commuID){
       
        List<Post> boardList = service.getCommuPost(commuID);

        return boardList;
    }
    
    @ResponseBody
    @GetMapping("/info")
    public CommuInfo getCommuInfo(@RequestParam("commuID") String commuID) {
        CommuInfo commuInfo = service.getCommuInfo(commuID);

        return commuInfo;
    }
    
    
    @ResponseBody
    @GetMapping("/lget")
    public List<Gathering> getGathering() {
       
        List<Gathering> gatheringList = service.getGathering();

        return gatheringList;
    }
    
    
    @ResponseBody
    @GetMapping("/lmake")
    public String lmake(
            @RequestParam("title") String title,
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime,
            @RequestParam("check") String check,
            @RequestParam("location") String location,
            @RequestParam("text") String text,
            @RequestParam("capacity") int capacity,
            @RequestParam("price") int price  
        ) {
            
            System.out.println("?���?: " + title);
            System.out.println("?��?�� ?���?: " + startTime);
            System.out.println("종료 ?���?: " + endTime);
            System.out.println("체크박스: " + check);
            System.out.println("�??��: " + location);
            System.out.println("?��?��: " + text);
            System.out.println("?��?��: " + capacity);
            System.out.println("?���?: " + price);

            // ?�� �?분에?�� Gathering 객체�? ?��?��?���? ?��비스�? ?��출하?�� 로직?�� 추�??��?�� ?��?��?��.
            service.lmake(new Gathering(title, startTime, endTime, location, text, price, capacity));

            return "1";
        }
}