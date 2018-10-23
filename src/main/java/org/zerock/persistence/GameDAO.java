package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;

public interface GameDAO {

	//게임 카테고리1
	public List<GameCategory1VO> selectGameType() throws Exception;
	
	//게임 리스트
	public List<GameVO> selectAllGame() throws Exception;
	
	//게임 카테고리2
	public List<GameCategory2VO> selectGameCategory2(int idx) throws Exception;
	
	//게임 카테고리2
	public List<GameCategory3VO> selectGameCategory3() throws Exception;
	
	//특정 게임 리스트
	public List<GameVO> selectGame(int idx) throws Exception;
	
	//특정 게임 리스트2
	public List<GameVO> selectGame2(int idx) throws Exception;
	
	//콘솔 게임 카테고리
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception;
	
	//장르 조회
	public List<GenreVO> selectGenre() throws Exception;
}
