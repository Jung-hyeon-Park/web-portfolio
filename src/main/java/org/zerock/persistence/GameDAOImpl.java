package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GenreVO;

@Repository
public class GameDAOImpl implements GameDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "org.zerock.mapper.GameMapper";
	
	
	//콘솔 게임 카테고리1
	@Override
	public List<GameCategory1VO> selectConsoleCategory1(GameListVO gameListVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectConsole1", gameListVO);
	}
	
	//게임 리스트 조회
	@Override
	public List<GameListVO> selectGameList(GameListVO gameListVO) throws Exception {
		System.out.println("asdfasdf = " + gameListVO.getCategoryIdx());
		return sqlSession.selectList(NAMESPACE+".selectGameList", gameListVO);
	}
	
	//특정 콘솔 카테고리
	@Override
	public List<GameCategory2VO>selectCertainConsoleCategory(GameListVO gameListVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectCertainConsoleCategory", gameListVO);
	}
	
	//콘솔 게임 카테고리2
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
