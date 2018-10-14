package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostVO;
import org.zerock.domain.SearchVO;

public interface BoardService {
	
	//게시글 추가
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	//게시글 수정
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	//게시글 삭제
	public void deleteBoard(int idx) throws Exception;
	
	//게시글 조회
	public BoardVO readBoard(int idx) throws Exception;
	
	//게시판 리스트
	public List<PostVO> selectPost() throws Exception;
	
	//게시글 리스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	//게시글 카운트
	public int listCountCriteria(Criteria cri) throws Exception;
	
	//검색한 게시글 리스트
	public List<BoardVO> listSearch(SearchVO cri) throws Exception;
	
	//검색한 게시글 카운트
	public int listSearchCount(SearchVO cri) throws Exception;
	
}
