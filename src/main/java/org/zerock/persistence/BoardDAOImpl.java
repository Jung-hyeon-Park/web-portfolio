package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GameDTO;
import org.zerock.domain.GameVO;
import org.zerock.domain.NominationVO;
import org.zerock.domain.PostVO;
import org.zerock.domain.ReviewDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "org.zerock.mapper.BoardMapper";
	
	//파일 조회
	@Override
	public List<String> selectNews() throws Exception {
		return sqlSession.selectList(namespace+".selectNews");
	}
	
	//게임 추가
	@Override
	public void insertGame(GameVO gameVO) throws Exception {
		sqlSession.insert(namespace+".insertGame", gameVO);
	}
	
	//게임 조회
	@Override
	public GameDTO selectGame(int boardIdx) throws Exception {
		return sqlSession.selectOne(namespace+".selectGame", boardIdx);
	}
	
	//게임 수정
	@Override
	public void updateGame(GameVO gameVO) throws Exception {
		sqlSession.update(namespace+".updateGame", gameVO);
	}
	
	// 게시글 추가
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		sqlSession.insert(namespace+".insertBoard", boardVO);
	}
	
	// 게시글 수정
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		sqlSession.update(namespace + ".updateBoard", boardVO);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(int idx) throws Exception {
		sqlSession.delete(namespace + ".deleteBoard", idx);
	}

	//게시글 조회
	@Override
	public BoardVO readBoard(int idx) throws Exception {
		return sqlSession.selectOne(namespace + ".readBoard", idx);
	}
	
	// 게시글 조회수
	@Override
	public int viewCount(int idx) throws Exception {
		return sqlSession.update(namespace + ".viewCount", idx);
	}
	// 게시판 리스트
	@Override
	public List<PostVO> selectPost() throws Exception {
		return sqlSession.selectList(namespace+".selectPost");
	}
	
	//게시판 리스트2
	@Override
	public List<PostVO> selectPost2() throws Exception {
		return sqlSession.selectList(namespace+".selectPost2");
	}
	
	//게시글 리스트
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".listCriteria", cri);
	}
	
	//게시글 카운트
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".countPaging", cri);
	}
	
	//검색한 게시글 리스트
	@Override
	public List<BoardVO> listSearch(SearchVO cri) throws Exception {
		return sqlSession.selectList(namespace+".listSearch", cri);
	}
	
	//검색한 게시글 카운트
	@Override
	public int listSearchCount(SearchVO cri) throws Exception {
		return sqlSession.selectOne(namespace+".listSearchCount", cri);
	}
	
	//파일 추가
	@Override
	public void addFiles(String fileName) throws Exception {
		sqlSession.insert(namespace+".addFiles", fileName);
	}
	
	//파일 삭제
	@Override
	public void deleteFiles(int boardIdx) throws Exception {
		sqlSession.delete(namespace+".deleteFiles", boardIdx);
	}
		
	//파일 수정
	@Override
	public void replaceFiles(String fullName, int boardIdx) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardIdx", boardIdx);
		paramMap.put("fullName", fullName);
		
		sqlSession.insert(namespace+".replaceFiles", paramMap);
	}
	
	//파일 조회
	@Override
	public List<String> getFiles(int boardIdx) throws Exception {
		return sqlSession.selectList(namespace+".getFiles", boardIdx);
	}
	
	//리뷰게시글 추가
	@Override
	public void insertReview(ReviewVO reviewVO) throws Exception {
		sqlSession.insert(namespace+".insertReview", reviewVO);
	}
	
	//리뷰 조회
	@Override
	public ReviewDTO selectReview(int boardIdx) throws Exception {
		return sqlSession.selectOne(namespace+".selectReview", boardIdx);
	}
	
	//리뷰 수정
	@Override
	public void updateReview(ReviewVO reviewVO) throws Exception {
		sqlSession.update(namespace+".updateReview", reviewVO);
	}
	
	//게시글 추천
	@Override
	public void insertNomination(NominationVO nominationVO) throws Exception {
		sqlSession.insert(namespace+".insertNomination", nominationVO);
	}
	
	//게시글 추천 조회
	@Override
	public int selectNomination(NominationVO nominationVO) throws Exception {
		return sqlSession.selectOne(namespace+".selectNomination", nominationVO);
	}
	
	//게시글 추천 삭제
	@Override
	public void deleteNomination(NominationVO nominationVO) throws Exception {
		sqlSession.delete(namespace+".deleteNomination", nominationVO);
	}
	
	//게시글 추천 수정
	@Override
	public void updateNomination(int boardIdx) throws Exception {
		sqlSession.update(namespace+".updateNomination", boardIdx);
	}
}
