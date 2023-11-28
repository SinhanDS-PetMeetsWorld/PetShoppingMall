package sinhanDS.first.project.login;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	// 이메일 중복체크
	int dupEmail(String email);
	// 회원가입
	int regist(UserVO vo);
	// 로그인
	UserVO login(UserVO vo);
	// 회원조회
	UserVO detail(int no);
	// 회원수정
	int update(UserVO vo);
}
