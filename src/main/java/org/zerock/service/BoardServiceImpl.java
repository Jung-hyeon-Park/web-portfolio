package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostVO;
import org.zerock.domain.SearchVO;
import org.zerock.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDAO;
	
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
	
}
