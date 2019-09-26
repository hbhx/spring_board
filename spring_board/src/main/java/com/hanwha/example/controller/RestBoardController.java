package com.hanwha.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@RestController
@RequestMapping("/restboard/*")
public class RestBoardController {
	
	@Autowired
	private BoardService boardService;

	// 01. 게시글 목록
	@RequestMapping("sns.do")
	public ModelAndView sns() throws Exception {
		ModelAndView mav = new ModelAndView();
		/*
		 * ArrayList<BoardVO> list = (ArrayList<BoardVO>)
		 * boardService.listAll(); mav.addObject("list", list);
		 */
		mav.setViewName("board/sns");
		return mav;
	}

	@RequestMapping("list.do")
	public List<BoardVO> list() throws Exception {
		List<BoardVO> list =  boardService.listAll();
		return list;
	}

	//게시글 작성 처리
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("boardvo") BoardVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/restboard/sns.do"));
		System.out.println(vo.toString());
		boardService.write(vo);
		return mav;
	} 


	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public ModelAndView delete(@RequestParam int bno) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/restboard/sns.do"));
		boardService.delete(bno);
        return mav;
	}
} 
