package com.cp.member.dao;

import com.cp.loginInfo.LoginInfo;
import com.cp.member.MemberDto;

public interface IMemberDao {
	void memberInsert(MemberDto dto);
	MemberDto memberSelect(String member_id, String member_pwd);
	void memberUpdate();
	MemberDto memberCheck(MemberDto dto);
	void memberRemove(MemberDto dto);
	String idCheck(String id);
	void loginInfoInput(LoginInfo login);
	void loginRemove(MemberDto member);
}
