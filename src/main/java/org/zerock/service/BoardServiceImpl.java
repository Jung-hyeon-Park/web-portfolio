package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
import org.zerock.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDAO;
	
	//뉴스 이미지 조회
	@Override
	public List<FileVO> selectNews() throws Exception {
		return boardDAO.selectNews();
	}
	
	//게임 추가
	@Transactional
	@Override
	public void insertGame(GameVO gameVO, BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		boardDAO.insertGame(gameVO);
		
	}
	
	//게임 조회
	@Override
	public GameDTO selectGame(int boardIdx) throws Exception {
		return boardDAO.selectGame(boardIdx);
	}
	
	//게임 수정
	@Transactional
	@Override
	public void updateGame(GameVO gameVO, BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
		boardDAO.updateGame(gameVO);
		
		int boardIdx = boardVO.getIdx();
		boardDAO.deleteFiles(boardIdx);
		
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		} 
		
		for(String fileName : files) {
			boardDAO.replaceFiles(fileName, boardIdx);
		}
	}
	
	//게시글 추가
	@Transactional
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			boardDAO.addFiles(fileName);
		}
	}
	
	//게시글 수정
	@Transactional
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		
		boardDAO.updateBoard(boardVO);
		
		int boardIdx = boardVO.getIdx();
		boardDAO.deleteFiles(boardIdx);
		
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			boardDAO.replaceFiles(fileName, boardIdx);
		}
	}
	
	//게시글 삭제
	@Transactional
	@Override
	public void deleteBoard(int idx) throws Exception {
		boardDAO.deleteFiles(idx);
		boardDAO.deleteBoard(idx);
	}
	
	//게시글 조회
	@Override
	public BoardVO readBoard(int idx) throws Exception {
		boardDAO.viewCount(idx);
		return boardDAO.readBoard(idx);
	}
	
	//게시판 리스트
	@Override
	public List<PostVO> selectPost() throws Exception {
		return boardDAO.selectPost();
	}
	
	//게시판 리스트2
	@Override
	public List<PostVO> selectPost2() throws Exception {
		return boardDAO.selectPost2();
	}
	
	//게시글 리스트
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return boardDAO.listCriteria(cri);
	}
	
	//게시글 카운트
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return boardDAO.countPaging(cri);
	}
	
	//검색한 게시글 리스트
	@Override
	public List<BoardVO> listSearch(SearchVO cri) throws Exception {
		return boardDAO.listSearch(cri);
	}
	
	//검색한 게시글 카운트
	@Override
	public int listSearchCount(SearchVO cri) throws Exception {
		return boardDAO.listSearchCount(cri);
	}
	
	//파일 조회
	@Override
	public List<String> getFiles(int boardIdx) throws Exception {
		return boardDAO.getFiles(boardIdx);
	}
	
	//리뷰게시글 추가
	@Transactional
	@Override
	public void insertReview(ReviewVO reviewVO, BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			boardDAO.addFiles(fileName);
		}
		reviewVO.setBoardIdx(boardVO.getIdx());
		boardDAO.insertReview(reviewVO);
	}
	
	//리뷰 조회
	@Override
	public ReviewDTO selectReview(int boardIdx) throws Exception {
		return boardDAO.selectReview(boardIdx);
	}
	
	//리뷰 수정
	@Transactional
	@Override
	public void updateReview(ReviewVO reviewVO, BoardVO boardVO) throws Exception {
		
		boardDAO.updateBoard(boardVO);
		boardDAO.updateReview(reviewVO);
		
		int boardIdx = boardVO.getIdx();
		boardDAO.deleteFiles(boardIdx);
		
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			boardDAO.replaceFiles(fileName, boardIdx);
		}
	}
	
	//게시글 추천
	@Transactional
	@Override
	public void insertNomination(NominationVO nominationVO) throws Exception {
		boardDAO.insertNomination(nominationVO);
		boardDAO.updateNomination(nominationVO.getBoardIdx());
	}
	
	//게시글 추천 조회
	@Override
	public int selectNomination(NominationVO nominationVO) throws Exception {
		return boardDAO.selectNomination(nominationVO);
	}
	
	//게시글 추천 삭제
	@Transactional
	@Override
	public void deleteNomination(NominationVO nominationVO) throws Exception {
		boardDAO.deleteNomination(nominationVO);
		boardDAO.updateNomination(nominationVO.getBoardIdx());
	}
	
}
