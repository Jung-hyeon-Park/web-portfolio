package org.zerock.service;

import java.util.List;

import org.zerock.domain.CommentVO;

public interface CommentService {

	//댓글 생성
	public void insertComment(CommentVO commentVO) throws Exception;
		
	//댓글 리스트
	public List<CommentVO> selectComment(int boardIdx) throws Exception;
}
