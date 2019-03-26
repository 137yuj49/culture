package com.cp.member.service;

import com.cp.loginInfo.LoginInfo;
import com.cp.member.MemberDto;

public interface IMemberService {
	void memberRegister(MemberDto dto);
	MemberDto memberSearch(String member_id, String member_pwd);
	void memberModify();
	void memberRemove();
	MemberDto memberCheck(MemberDto dto);
	void memberRemove(MemberDto dto);
	String idCheck(String id);
	void loginInfoInput(LoginInfo login);
	void loginRemove(MemberDto member);
}
