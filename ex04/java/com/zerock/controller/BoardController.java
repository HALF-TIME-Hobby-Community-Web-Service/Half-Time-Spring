package com.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zerock.domain.BoardVO;
import com.zerock.domain.Criteria;
import com.zerock.domain.PageDTO;
import com.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor //BoardController(BoardService) 생성자 만들어 줌
@Controller
@Log4j
@RequestMapping("/board/*") 
public class BoardController {
   
      @Setter(onMethod_ = @Autowired) //setService(BoardService) DI
      private BoardService service;
      
                  
      @GetMapping("/list") 
      public void list(Criteria cri, Model model) { 
         
         log.info("list 요청"+cri);
         List<BoardVO> list = service.getList(cri);
         model.addAttribute("list",list);
         model.addAttribute("pageMaker", new PageDTO(cri,service.getTotal(cri))); // PageDTO(Criteria cri, int total)
         list.forEach(board -> log.info(board));
      }

      
      @GetMapping("/register")
      public void register() {
         //log.info("regeister GET 요청");
         //register.jsp파일 자동 실행(register.jsp파일에서 form으로 post요청하면 아래 메서드 실행됨)
      }

      
      @PostMapping("/register")
      public String register(BoardVO board, RedirectAttributes rttr) { //redirect할 땐 RedirectAttributes, redirect안할 땐 Model 쓰기
         log.info("register: "+board);
         service.register(board);
         rttr.addFlashAttribute("origin","register");
         rttr.addFlashAttribute("result",board.getBno()); //addAttribute() 영구적, addFlashAttribute() 일시적
         return "redirect:/board/list"; 
         //redirect: 안하면 form의 action으로 요청한 /register url이 그대로임. 페이지내용 안 바뀌니까 redirect로 클라이언트가 서버에게 /list url 재요청 하도록해서 insert된 list화면 보여지도록 하는 것
      }
      
      
      @GetMapping({"/get","/modify"})
      public void get(long bno,@ModelAttribute("cri") Criteria cri, Model model) { //Model model.addAttribute or @ModelAttribute("")
         
         model.addAttribute("board",service.get(bno));
      }

   
      @PostMapping("/modify")
      public String modify(BoardVO board,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
         log.info("modify: "+board);
         log.info("cri: "+cri);
         boolean result=service.modify(board);
         log.info("result: "+result);
         rttr.addFlashAttribute("origin","modify");
         if(result) 
            rttr.addFlashAttribute("result",board.getBno());          
         else
            rttr.addFlashAttribute("result",-1);                
         rttr.addAttribute("pageNum",cri.getPageNum());
         rttr.addAttribute("amount",cri.getAmount());
         rttr.addAttribute("type",cri.getType());
         rttr.addAttribute("keyword",cri.getKeyword());
         return "redirect:/board/list";
         //return "redirect:/board/list/?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
      }
   
      @PostMapping("/delete")
      public String delete(long bno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
         log.info("delete: "+bno);
         boolean result=service.remove(bno);
         log.info("result: "+result);         
         rttr.addFlashAttribute("origin","delete");
         if(result)
            rttr.addFlashAttribute("result",bno);    
         else
            rttr.addFlashAttribute("result",-1);    
         
         rttr.addAttribute("pageNum",cri.getPageNum());
         rttr.addAttribute("amount",cri.getAmount());
         return "redirect:/board/list";
      }
      
      
}