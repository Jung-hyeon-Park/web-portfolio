package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;

@Repository
public class GameDAOImpl implements GameDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "org.zerock.mapper.GameMapper";
	
	
	//게임 카테고리1
	@Override
	public List<GameCategory1VO> selectGameType() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGameType");
	}
	
	//게임 리스트
	@Override
	public List<GameVO> selectAllGame() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectAllGame");
	}
	
	//게임 카테고리2
	@Override
	public List<GameCategory2VO> selectGameCategory2(int idx) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGameCategory2", idx);
	}
	
	//게임 카테고리3
	@Override
	public List<GameCategory3VO> selectGameCategory3() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGameCategory3");
	}
	
	//특정 게임 리스트
	@Override
	public List<GameVO> selectGame(int idx) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGame", idx);
	}
	
	//특정 게임 리스트
	@Override
	public List<GameVO> selectGame2(int idx) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGame2", idx);
	}
	
	//콘솔 게임 카테고리
	@Override
	public List<GameCategory2VO> selectConsoleCategory2() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectConsole2");
	}
	
	//장르 조회
	@Override
	public List<GenreVO> selectGenre() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGenre");
	}
}
