package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.NominationVO;
import org.zerock.domain.PostVO;
import org.zerock.domain.ReviewDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.SearchVO;
import org.zerock.domain.SimpleBoardDTO;

public interface BoardDAO {
	
	//인기 리뷰 게시글 조회 
	public List<SimpleBoardDTO> selectTopReview() throws Exception;
	
	//뉴스 조회
	public List<SimpleBoardDTO> selectNews() throws Exception;
	
	
	// 게시글 추가
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(int idx) throws Exception;
	
	// 게시글 조회
	public BoardVO readBoard(int idx) throws Exception;
	
	//게시글 조회수 
	public int viewCount(int idx) throws Exception;
	
	//게시판 리스트
	public List<PostVO> selectPost() throws Exception;
	
	//게시판 리스트2
	public List<PostVO> selectPost2() throws Exception;
	
	//게시판 리스트3
	public List<PostVO> selectPost3() throws Exception;
	
	//게시글 리스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	//게시글 카운트
	public int countPaging(Criteria cri) throws Exception;
	
	//검색한 게시글 리스트
	public List<BoardVO> listSearch(SearchVO cri) throws Exception;
	
	//검색한 게시글 카운트
	public int listSearchCount(SearchVO cri) throws Exception;
	
	//파일 추가
	public void addFiles(String fullName) throws Exception;
	
	//파일 삭제
	public void deleteFiles(int boardIdx) throws Exception;
	
	//파일 수정
	public void replaceFiles(String fullName, int boardIdx) throws Exception;
	
	//파일 조회
	public List<String> getFiles(int boardIdx) throws Exception;
	
	//리뷰게시글 추가
	public void insertReview(ReviewVO reviewVO) throws Exception;
	
	//리뷰게시글 조회
	public ReviewDTO selectReview(int boardIdx) throws Exception;
	
	//리뷰게시글 수정
	public void updateReview(ReviewVO reviewVO) throws Exception;
	
	//리뷰게시글 삭제
	public void deleteReview(int boardIdx) throws Exception;
	
	//게시글 추천
	public void insertNomination(NominationVO nominationVO) throws Exception;
	
	//게시글 추천 조회 
	public int selectNomination(NominationVO nominationVO) throws Exception;
	
	//개인 추천 삭제
	public void deleteNomination(NominationVO nominationVO) throws Exception;
	
	//게시글 추천 삭제
	public void deleteBoardNomination(int boardIdx) throws Exception;
	//게시글 추천 수정
	public void updateNomination(int boardIdx) throws Exception;
}
