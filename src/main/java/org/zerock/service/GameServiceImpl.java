package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;
import org.zerock.persistence.GameDAO;

@Service
public class GameServiceImpl implements GameService {

	@Inject
	private GameDAO gameDAO;
	
	
	//게임 카테고리1
	@Override
	public List<GameCategory1VO> selectGameType() throws Exception {
		return gameDAO.selectGameType();
	}

	//게임 리스트
	@Override
	public List<GameVO> selectAllGame() throws Exception {
		return gameDAO.selectAllGame();
	}
	
	//게임 카테고리2
	@Override
	public List<GameCategory2VO> selectGameCategory2(int idx) throws Exception {
		return gameDAO.selectGameCategory2(idx);
	}
	
	//게임 카테고리3
	@Override
	public List<GameCategory3VO> selectGameCategory3() throws Exception {
		return gameDAO.selectGameCategory3();
	}
	
	//특정 게임 리스트
	@Override
	public List<GameVO> selectGame(int idx) throws Exception {
		return gameDAO.selectGame(idx);
	}
	
	//특정 게임 리스트2
	@Override
	public List<GameVO> selectGame2(int idx) throws Exception {
		return gameDAO.selectGame2(idx);
	}
	
	//콘솔 게임 카테고리
	@Override
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception {
		return gameDAO.selectConsoleCategory2();
	}
	
	//장르 조회
	@Override
	public List<GenreVO> selectGenre() throws Exception {
		return gameDAO.selectGenre();
	}
}
