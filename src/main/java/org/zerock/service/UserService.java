package org.zerock.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.zerock.domain.LoginDTO;
import org.zerock.domain.PlusUserVO;
import org.zerock.domain.UserGameVO;
import org.zerock.domain.UserGenreVO;
import org.zerock.domain.UserVO;

public interface UserService {
	
	//회원가입
	public int insertUser(UserVO userVO) throws Exception;
	
	//회원 추가 정보
	public void insertPlusUser(PlusUserVO plusUserVO) throws Exception;

	//로그인 체크
	public UserVO login(LoginDTO loginDTO) throws Exception;

	//로그아웃
	public void logout(HttpSession session) throws Exception;

	//자동로그인
	public void keepLogin(String email, String sessionId, Date next) throws Exception;

	//세션키
	public UserVO checkLoginBefore(String value) throws Exception;
	
	//회원 리스트
	public List<UserVO> selectUsers() throws Exception;

}
