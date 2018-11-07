package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameClassificationVO;
import org.zerock.domain.GameDTO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;
import org.zerock.domain.SearchVO;
import org.zerock.domain.UserGameVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.GameDAO;

@Service
public class GameServiceImpl implements GameService {

	@Inject
	private GameDAO gameDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	
	//게임 추가
	@Transactional
	@Override
	public void insertGame(GameVO gameVO, BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		String[] files = boardVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			boardDAO.addFiles(fileName);
		}
		int gameClassificationIdx = gameDAO.selectGameClassificationIdx(boardVO.getTitle());
	
		gameVO.setGameClassificationIdx(gameClassificationIdx);
		gameVO.setBoardIdx(boardVO.getIdx());
		gameDAO.insertGame(gameVO);
	}
	
	//게임 조회
	@Override
	public GameDTO selectGame(int boardIdx) throws Exception {
		return gameDAO.selectGame(boardIdx);
	}
	
	//게임 수정
	@Transactional
	@Override
	public void updateGame(GameVO gameVO, BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
		int gameClassificationIdx = gameDAO.selectGameClassificationIdx(boardVO.getTitle());
		gameVO.setGameClassificationIdx(gameClassificationIdx);
		gameDAO.updateGame(gameVO);
		
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
	
	//게임 삭제
	@Transactional
	@Override
	public void deleteGame(int boardIdx) throws Exception {
		gameDAO.deleteGame(boardIdx);
		if(boardDAO.getFiles(boardIdx) != null) {
			boardDAO.deleteFiles(boardIdx);
		}
		
		if(boardDAO.readBoard(boardIdx).getLikeCount() > 0) {
			boardDAO.deleteBoardNomination(boardIdx);
		}
		boardDAO.deleteBoard(boardIdx);
	}
	
	//콘솔 게임 카테고리1
	@Override
	public List<GameCategory1VO> selectConsoleCategory1(GameCategory1VO gameCategory1VO) throws Exception {
		return gameDAO.selectConsoleCategory1(gameCategory1VO);
	}
	
	//게임 리스트 조회
	@Override
	public List<GameListVO> selectGameList(GameListVO gameListVO) throws Exception {
		return gameDAO.selectGameList(gameListVO);
	}
	
	//특정 콘솔 카테고리
	@Override
	public List<GameCategory2VO>selectCertainConsoleCategory(GameListVO gameListVO) throws Exception {
		return gameDAO.selectCertainConsoleCategory(gameListVO);
	}
	
	//콘솔 게임 카테고리2
	@Override
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception {
		return gameDAO.selectConsoleCategory2();
	}
	
	//장르 조회
	@Override
	public List<GenreVO> selectGenre() throws Exception {
		return gameDAO.selectGenre();
	}
	
	//모든 콘솔 필터 조회 
	@Override
	public List<GameCategory2VO> selectAllCategory2() throws Exception {
		return gameDAO.selectAllCategory2();
	}
	
	//모든 분류 필터 조회 
	@Override
	public List<GameCategory3VO> selectAllCategory3() throws Exception {
		return gameDAO.selectAllCategory3();
	}
	
	//ajax 게임 리스트
	@Override
	public List<GameListVO> ajaxGameList(GameCategory1VO gameCategory1VO) throws Exception {
		return gameDAO.ajaxGameList(gameCategory1VO);
	}
	
	//ajax 게임 제목
	@Override
	public List<String> ajaxGameTitle(String title) throws Exception {
		return gameDAO.ajaxGameTitle(title);
	}
	
	//모든 게임 이름 조회
	@Override
	public List<GameClassificationVO> selectGameTitle() throws Exception {
		return gameDAO.selectGameTitle();
	}
	
	//키워드 검색 게임 리스트
	@Override
	public List<GameListVO> selectSearchGameList(SearchVO cri) throws Exception {
		return gameDAO.selectSearchGameList(cri);
	}
	
	//상품 조회 데이터 넣기
	@Override
	public void insertViewData(UserGameVO userGameVO) throws Exception {
		gameDAO.insertViewData(userGameVO);
	}
}
