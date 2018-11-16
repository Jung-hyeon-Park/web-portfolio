package org.zerock.service;

import java.util.List;

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

public interface GameService {
	
	//게임 추가
	public void insertGame(GameVO gameVO, BoardVO boardVO) throws Exception;
	
	//게임 조회
	public GameDTO selectGame(int boardIdx) throws Exception;
	
	//게임 수정
	public void updateGame(GameVO gameVO, BoardVO boardVO) throws Exception;
	
	//게임 삭제
	public void deleteGame(int boardIdx) throws Exception;
	
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
	
	//ajax 게임 리스트
	public List<GameListVO> ajaxGameList(GameCategory1VO gameCategory1VO) throws Exception;
	
	//ajax 게임 제목
	public List<String> ajaxGameTitle(String title) throws Exception;
	
	//모든 게임 이름 조회
	public List<GameClassificationVO> selectGameTitle() throws Exception;
	
	//키워드 검색 게임 리스트
	public List<GameListVO> selectSearchGameList(SearchVO cri) throws Exception;

	//상품 조회 데이터 넣기
	public void insertViewData(UserGameVO userGameVO) throws Exception;
	
	//게임 랭킹 카테고리
	public List<GameCategory2VO> selectRankingPost() throws Exception;
	
	//추천 게임 리스트
	public List<GameListVO> recommendList() throws Exception;
}
