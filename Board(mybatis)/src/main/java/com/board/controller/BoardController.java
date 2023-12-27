package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.model.BoardVO;
import com.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	// 게시판 조회 화면
	@GetMapping("/list")
    // => @RequestMapping(value="list", method=RequestMethod.GET)
    public String boardListGET(Model model) {
        log.info("게시판 목록 페이지 진입");
        
        List<BoardVO> list = service.getList();
        
        model.addAttribute("list", list);
        
        return "/board/list";
    }
    
	// 게시판 등록 화면
    @GetMapping("/enroll")
    public void boardEnrollGET() {
        log.info("게시판 등록 페이지 진입");
    }
    
    // 게시판 등록
    @PostMapping("/enroll")
    public String boardEnrollPost(BoardVO vo, RedirectAttributes rttr) {
    	log.info("BoardVO : "+ vo);
    	
    	service.enroll(vo);
    	
    	rttr.addFlashAttribute("result", "enroll success");
    	
    	return "redirect:/board/list";
    }
    
    // 게시판 조회
    @GetMapping("/get")
    public String boardGetDetail(int bno, Model model) {
    	
    	BoardVO vo = service.getDetail(bno);
    	
    	model.addAttribute("vo", vo);
    	
    	return "/board/get";
    }
    // 수정 페이지 이동 
    @GetMapping("/modify")
    public String boardModifyGET(int bno, Model model) {
    	model.addAttribute("vo", service.getDetail(bno));
    	
    	return "/board/modify";
    }
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
        
        service.modify(board);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/list";
        
    }
    /* 페이지 삭제 */
    @GetMapping("/delete")
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
        
        service.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/board/list";
    }
    

}
