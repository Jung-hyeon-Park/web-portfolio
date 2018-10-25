package org.zerock.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.PlusUserVO;
import org.zerock.domain.UserGameVO;
import org.zerock.domain.UserGenreVO;
import org.zerock.domain.UserVO;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserDAO userDAO;
	
	//회원가입
	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return userDAO.insertUser(userVO);
	}
	
	//회원 추가 정보
	@Transactional
	@Override
	public void insertPlusUser(PlusUserVO plusUserVO) throws Exception {
		UserGenreVO userGenreVO = new UserGenreVO();
		UserGameVO userGameVO = new UserGameVO();
		
		userGenreVO.setUserIdx(plusUserVO.getUserIdx());
		userGenreVO.setGenreIdxes(plusUserVO.getGenreIdx());
		userGenreVO.setAge(plusUserVO.getAge());
		
		userGameVO.setUserIdx(plusUserVO.getUserIdx());
		userGameVO.setCategory2Idxes(plusUserVO.getCategory2Idx());
		userGameVO.setAge(plusUserVO.getAge());
		
		int[] genreIdxes = userGenreVO.getGenreIdxes();
		for(int genreIdx : genreIdxes) {
			userGenreVO.setGenreIdx(genreIdx);
			userDAO.insertUserGenre(userGenreVO);
		}
		
		int[] category2Idxes = userGameVO.getCategory2Idxes();
		for(int category2Idx : category2Idxes) {
			userGameVO.setCategory2Idx(category2Idx);
			userDAO.insertUserGame(userGameVO);
		}
	}
	
	//로그인 체크
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return userDAO.login(loginDTO);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	//자동로그인
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		userDAO.keepLogin(email, sessionId, next);
	}
	
	//세션키
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDAO.checkUserWithSessionKey(value);
	}
	
	//회원 리스트
	@Override
	public List<UserVO> selectUsers() throws Exception {
		return userDAO.selectUsers();
	}
}
