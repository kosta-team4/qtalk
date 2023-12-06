package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.javassist.compiler.MemberResolver;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDao;
	public MemberServiceImpl() {
		memberDao = new MemberDAOImpl();
	}
	
	@Override
	public void join(Member member) throws Exception {
		Member smember = memberDao.selectMember(member.getId());
		if(smember!=null) throw new Exception("회원가입 오류");
		memberDao.insertMember(member);
	}
	
	@Override
	public Member login(String id, String password) throws Exception {
		Member member = memberDao.selectMember(id);
		if(member==null) throw new Exception("아이디 오류");
		if(member.getPassword().equals(password)==false) throw new Exception("비밀번호 오류");
		return member;
	}
	
	// 회원탈퇴
	@Override
	public void memberDelete(String id) throws Exception {
		memberDao.deleteMember(id);
	}
	// 내 정보 수정 (닉네임, 비밀번호)
	@Override
	public void memberchange(Member member) throws Exception {
		memberDao.updateMember(member);
	}
	
	@Override
	public String idforget(String email) throws Exception {
		String id = memberDao.selectMemberId(email);
		if(id==null) throw new Exception("존재하지 않는 이메일 입니다. 다시 입력해 주세요.");
		return id;
	}
	
	@Override
	public String pwforget(String id, String email) throws Exception {
		Member member = memberDao.selectMember(id);
		if(member == null) throw new Exception("존재하지 않는 아이디 입니다. 다시 입력해 주세요1.");
		if(!(member.getEmail().equals(email))) throw new Exception("아이디와 이메일이 정확하지 않습니다. 다시 입력해 주세요2.");
		member.setEmail(email);
		return member.getPassword();
	}

	@Override
	public Boolean idCheck(String id) throws Exception {
		Member member = memberDao.selectMember(id);
		if(member == null) return true;
		return false;
	}

	// 회원가입 닉네임 중복확인
	@Override
	public Boolean nicknameCheck(String nickname) throws Exception {
		Member member = memberDao.selectMemberWhereNickname(nickname);
		if(member == null) return true;
		return false;
	}

	@Override
	public Boolean eamilCheck(String email) throws Exception {
		Member member = memberDao.selectMemberWhereEmail(email);
		if(member == null) return true;
		return false;
	}

	@Override
	public Member selectMember(String id) throws Exception {
		return memberDao.selectMember(id);
	}

}
