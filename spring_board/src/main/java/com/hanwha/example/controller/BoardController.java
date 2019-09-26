package com.hanwha.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;

	// 01. 게시글 목록
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		// ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        ArrayList<BoardVO> list = (ArrayList<BoardVO>) boardService.listAll();
        mav.addObject("list",list);
        mav.setViewName("board/list");
        return mav;

	}

	// 02_01. 게시글 작성화면
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write() throws Exception {
		return "board/write";
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute("boardvo") BoardVO vo) throws Exception {
		System.out.println(vo.toString());
		boardService.write(vo);
		
		return "redirect:list.do";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value = "view.do/{bno}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable int bno, HttpSession session) throws Exception {
        // 조회수 증가 처리
        // boardService.increaseViewcnt(?, session);
        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mav = new ModelAndView();
        boardService.increaseViewcnt(bno, session);
        
        mav.addObject("post", boardService.view(bno));
        mav.setViewName("board/view");
        return mav;
    } 

	// 04. 게시글 수정
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(BoardVO vo) throws Exception {
		System.out.println(vo.toString());
		boardService.update(vo);
		
		return "redirect:list.do";
	}

	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception {
		boardService.delete(bno);
		
		return "redirect:list.do";
	}
}
