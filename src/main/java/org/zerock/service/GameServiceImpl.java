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
	public List<GameCategory1VO> selectConsoleCategory1() throws Exception {
		return gameDAO.selectConsoleCategory1();
	}
	
	//게임 리스트 조회
	public List<GameListVO> selectGameList() throws Exception {
		return gameDAO.selectGameList();
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
}
