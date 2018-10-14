package org.zerock.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.UserVO;

@Repository
public class UserDAOImpl  implements UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "org.zerock.mapper.UserMapper";
	
	//회원가입
	@Override
	public void insertUser(UserVO userVO) throws Exception {
		sqlSession.insert(namespace+".insertUser", userVO);
	}
	
	//회원 로그인 체크
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(namespace+".login", loginDTO);
	}
	
	//회원 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {}
	
	//자동로그인
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("sessionId", sessionId);
		map.put("next", next);
		sqlSession.update(namespace+".keepLogin", map);
	}
	
	//세션키
	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return sqlSession.selectOne(namespace+".checkUserWithSessionKey", value);
	}
	
	//회원 리스트
	@Override
	public List<UserVO> selectUsers() throws Exception {
		return sqlSession.selectList(namespace+".selectUsers");
	}
}
