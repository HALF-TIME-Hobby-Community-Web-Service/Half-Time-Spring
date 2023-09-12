package com.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zerock.domain.Criteria;
import com.zerock.domain.ReplyPageDTO;
import com.zerock.domain.ReplyVO;
import com.zerock.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
public class ReplyController {
   
   @Setter(onMethod_=@Autowired)
   private ReplyService service;
   
   @PostMapping(value="/new", consumes="application/json",
         produces= {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> create(@RequestBody ReplyVO vo){
      log.info("create" + vo);
      int insertConunt = service.register(vo);
      log.info("result:" + insertConunt);
      return insertConunt == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
            : new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
   }
   @GetMapping(value="/pages/{bno}/{page}")
   public ResponseEntity<ReplyPageDTO> getlist(@PathVariable("page") int page,@PathVariable("bno") long bno){
	   log.info("getlist page:" +page+ ", bno:" +bno);
	   Criteria cri = new Criteria(page, 10);
	   return new ResponseEntity<>(service.getList(bno,cri),HttpStatus.OK) ;
   }
   
   @GetMapping(value="/{rno}")
   public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){
      log.info("get:" + rno);
      return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
   
   
   }
   
   @DeleteMapping(value="/{rno}",produces="text/plain;charset=UTF-8")
   public ResponseEntity<String> remove(@PathVariable("rno") long rno){
	   log.info("remove:" +rno);
	   return service.remove(rno)== 1? new ResponseEntity<>("성공",HttpStatus.OK) :
		   new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @RequestMapping(method={RequestMethod.PUT, RequestMethod.PATCH},
		   value="/{rno}", consumes="application/json", produces="text/plain;charset=UTF-8")
   public ResponseEntity<String> modify(@PathVariable("rno") long rno,@RequestBody ReplyVO vo){
	   log.info("modify:" +rno +", vo:" +vo);
	   vo.setRno(rno);
	   return service.modify(vo)== 1? new ResponseEntity<>("성공",HttpStatus.OK) :
		   new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
}