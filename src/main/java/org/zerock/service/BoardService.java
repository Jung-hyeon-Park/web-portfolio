package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.FileVO;
import org.zerock.domain.GameDTO;
import org.zerock.domain.GameVO;
import org.zerock.domain.NominationVO;
import org.zerock.domain.PostVO;
import org.zerock.domain.ReviewDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.SearchVO;

public interface BoardService {
	
	//뉴스 이미지 조회
	public List<FileVO> selectNews() throws Exception;
	
	//게임 추가
	public void insertGame(GameVO gameVO, BoardVO boardVO) throws Exception;
	
	//게임 조회
	public GameDTO selectGame(int boardIdx) throws Exception;
	
	//게임 수정
	public void updateGame(GameVO gameVO, BoardVO boardVO) throws Exception;
	
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
	
	//게시판 리스트2
	public List<PostVO> selectPost2() throws Exception;
	
	//게시글 리스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	//게시글 카운트
	public int listCountCriteria(Criteria cri) throws Exception;
	
	//검색한 게시글 리스트
	public List<BoardVO> listSearch(SearchVO cri) throws Exception;
	
	//검색한 게시글 카운트
	public int listSearchCount(SearchVO cri) throws Exception;
	
	//파일 조회
	public List<String> getFiles(int boardIdx) throws Exception;
	
	//리뷰게시글 추가
	public void insertReview(ReviewVO reviewVO, BoardVO boardVO) throws Exception;
	
	//리뷰 조회
	public ReviewDTO selectReview(int boardIdx) throws Exception;
	
	//리뷰 수정
	public void updateReview(ReviewVO reviewVO, BoardVO boardVO) throws Exception;
	
	//게시글 추천
	public void insertNomination(NominationVO nominationVO) throws Exception;
	
	//게시글 추천 조회 
	public int selectNomination(NominationVO nominationVO) throws Exception;
	
	//게시글 추천 삭제
	public void deleteNomination(NominationVO nominationVO) throws Exception;
	
	
}
