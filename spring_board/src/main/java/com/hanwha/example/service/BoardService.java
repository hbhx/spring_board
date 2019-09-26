package com.hanwha.example.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hanwha.example.dto.BoardVO;

public interface BoardService {
	// 01. 게시글 작성
	public void write(BoardVO vo) throws Exception;
	// 02. 게시글 상세보기
	public BoardVO view(int bno) throws Exception;
	// 03. 게시글 수정
	public void update(BoardVO vo) throws Exception;
	// 04. 게시글 삭제
	public void delete(int bno) throws Exception;
	// 05. 게시글 전체 목록
	public List<BoardVO> listAll() throws Exception;
	// 06. 게시글 조회
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;
}
