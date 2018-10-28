package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameCategory3VO;
import org.zerock.domain.GameClassificationVO;
import org.zerock.domain.GameDTO;
import org.zerock.domain.GameListVO;
import org.zerock.domain.GameVO;
import org.zerock.domain.GenreVO;

@Repository
public class GameDAOImpl implements GameDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "org.zerock.mapper.GameMapper";
	
	
	//게임 추가
	@Override
	public void insertGame(GameVO gameVO) throws Exception {
		sqlSession.insert(NAMESPACE+".insertGame", gameVO);
	}
	
	//게임 조회
	@Override
	public GameDTO selectGame(int boardIdx) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".selectGame", boardIdx);
	}
	
	//게임 수정
	@Override
	public void updateGame(GameVO gameVO) throws Exception {
		sqlSession.update(NAMESPACE+".updateGame", gameVO);
	}
	
	//게임 삭제
	@Override
	public void deleteGame(int boardIdx) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteGame", boardIdx);
	}
	
	//콘솔 게임 카테고리1
	@Override
	public List<GameCategory1VO> selectConsoleCategory1(GameCategory1VO gameCategory1VO) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectConsole1", gameCategory1VO);
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
	
	//모든 콘솔 필터 조회 
	@Override
	public List<GameCategory2VO> selectAllCategory2() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectAllCategory2");
	}
	
	//모든 부품 필터 조회 
	@Override
	public List<GameCategory3VO> selectAllCategory3() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectAllCategory3");
	}
	
	//ajax 게임 리스트
	@Override
	public List<GameListVO> ajaxGameList(GameCategory1VO gameCategory1VO) throws Exception {
		return sqlSession.selectList(NAMESPACE+".ajaxGameList", gameCategory1VO);
	}
	
	//ajax 게임 제목
	@Override
	public List<String> ajaxGameTitle(String title) throws Exception {
		return sqlSession.selectList(NAMESPACE+".ajaxGameTitle", title);
	}
	
	//모든 게임 이름 조회
	@Override
	public List<GameClassificationVO> selectGameTitle() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectGameTitle");
	}
	
	//gameClassification idx 조회
	@Override
	public int selectGameClassificationIdx(String title) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".selectGameClassificationIdx", title);
	}
}
