package com.hanwha.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hanwha.example.dto.BoardVO;
@Component
public class BoardDao {

       @Autowired
       private SqlSession sqlSession;
       
       // 01. 게시글 작성
       //BoardVO 형태 파라미터
       public void create(BoardVO vo) throws Exception{
               sqlSession.insert("board.insert", vo);
       }
       
       // 02. 게시글 상세보기
       // int bno = 게시글 번호
       public BoardVO view(int bno) throws Exception{
    	   return sqlSession.selectOne("board.view", bno);
               //상세보기는 하나만 불러오기 때문에 selectOne 이용
       }
       
       // 03. 게시글 수정
       //BoardVO 형태 파라미터
       public void update(BoardVO vo) throws Exception{
           sqlSession.update("board.updateArticle", vo);
       }
       
       // 04. 게시글 삭제
       // int bno = 게시글 번호
       public void delete(int bno) throws Exception{
    	   sqlSession.delete("board.deleteArticle", bno);
       }
       
       // 05. 게시글 전체 목록
       //BoardVO 형태 파라미터
       public List<BoardVO> list() throws Exception{
    	   return sqlSession.selectList("board.listAll");
       }
       
       // 게시글 조회수 증가
       
       public void increaseViewcnt(int bno) throws Exception{
    	   sqlSession.update("board.increaseViewcnt", bno);
       }
}
