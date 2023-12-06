package dao;

import java.util.Map;

import dto.Member;

public interface MemberDAO {
	// 회원가입
	void insertMember(Member member) throws Exception;
	// 로그인
	Member selectMember(String id) throws Exception;
	// 회원탈퇴
	void deleteMember(String id) throws Exception;
	// 중복체크
	Member selectMemberWhereNickname(String nickname) throws Exception;
	Member selectMemberWhereEmail(String email) throws Exception;
	// 내 정보 수정
	void updateMember(Member member) throws Exception;
	// id,pw 찾기
	String selectMemberId(String email) throws Exception;
	String selectMemberPw(String id, String email) throws Exception;
//	Map<String,Object> selectMemberIdEmail(Map<String,Object> param) throws Exception;
}
