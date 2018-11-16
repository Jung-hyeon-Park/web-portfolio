package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "org.zerock.mapper.CommentMapper";
	
	//댓글 생성
	@Override
	public void insertComment(CommentVO commnetVO) throws Exception {
		sqlSession.insert(namespace+".insertComment", commnetVO);
	}
	
	//댓글 리스트
	@Override
	public List<CommentVO> selectComment(int boardIdx) throws Exception {
		return sqlSession.selectList(namespace+".selectComment", boardIdx);
	}
	
	//댓글 삭제
	@Override
	public void deleteComment(int boardIdx) throws Exception {
		sqlSession.delete(namespace+".deleteComment", boardIdx);
	}
}
