package org.zerock.persistence;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.zerock.domain.LoginDTO;
import org.zerock.domain.UserVO;

public interface UserDAO {

	//회원가입
	public void insertUser(UserVO userVO) throws Exception;

	//로그인 체크
	public UserVO login(LoginDTO loginDTO) throws Exception;

	//로그아웃
	public void logout(HttpSession session) throws Exception;

	//자동로그인
	public void keepLogin(String email, String sessionId, Date next) throws Exception;

	//세션키
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	
	//회원 리스트
	public List<UserVO> selectUsers() throws Exception;
	

}
