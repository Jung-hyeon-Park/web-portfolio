package org.zerock.service;

import java.util.List;

import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;

public interface GameService {
	
	//콘솔 게임 카테고리1
	public List<GameCategory1VO> selectConsoleCategory1(GameCategory1VO gameCategory1VO) throws Exception;
	
	//게임 리스트 조회
	public List<GameListVO> selectGameList(GameListVO gameListVO) throws Exception;
	
	//특정 콘솔 카테고리
	public List<GameCategory2VO>selectCertainConsoleCategory(GameListVO gameListVO) throws Exception;
	
	//콘솔 게임 카테고리
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception;
	
	//장르 조회
	public List<GenreVO> selectGenre() throws Exception;
	
	//모든 콘솔 필터 조회 
	public List<GameCategory2VO> selectAllCategory2() throws Exception;
	
	//모든 분류 필터 조회 
	public List<GameCategory3VO> selectAllCategory3() throws Exception;
	

}
