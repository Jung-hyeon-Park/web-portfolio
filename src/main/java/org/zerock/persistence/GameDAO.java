package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;

public interface GameDAO {

	//콘솔 게임 카테고리1
	public List<GameCategory1VO> selectConsoleCategory1() throws Exception;
	
	//게임 리스트 조회
	public List<GameListVO> selectGameList() throws Exception;
	
	//콘솔 게임 카테고리2
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception;
	
	//장르 조회
	public List<GenreVO> selectGenre() throws Exception;
}
