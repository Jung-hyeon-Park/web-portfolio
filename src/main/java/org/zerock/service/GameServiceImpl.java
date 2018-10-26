package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;
import org.zerock.persistence.GameDAO;

@Service
public class GameServiceImpl implements GameService {

	@Inject
	private GameDAO gameDAO;
	
	
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
}
