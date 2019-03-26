package com.cp.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cp.loginInfo.LoginInfo;
import com.cp.member.MemberDto;

@Repository
public class MemberDao implements IMemberDao{
	
	@Autowired
	SqlSessionTemplate temp;
	
	@Override
	public void memberInsert(MemberDto dto) {
		temp.insert("culturePage.memInsert", dto);
		System.out.println("member insert success!!!");
	}
	
	@Override
	public MemberDto memberSelect(String member_id, String member_pwd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void memberUpdate() {
		// TODO Auto-generated method stub
		
	}	
	
	@Override
	public MemberDto memberCheck(MemberDto dto) {
		System.out.println("MemberDao login id = " + dto.getId());
		System.out.println("MemberDao login pwd = " + dto.getPwd());
		MemberDto member = temp.selectOne("culturePage.memberCheck", dto);
		return member;
	}
	
	@Override
	public void memberRemove(MemberDto dto) {
		temp.delete("culturePage.memberRemove", dto);
		System.out.println("Member Remove success!!!!");
	}
	
	@Override
	public String idCheck(String id) {
		System.out.println("dao idCheck  id = " + id);
		String checkedId = temp.selectOne("culturePage.idCheck", id);
		System.out.println("Idcheck success!!!!");
		return checkedId;
	}
	
	@Override
	public void loginInfoInput(LoginInfo login) {
		temp.insert("culturePage.loginInfoInput", login);
		System.out.println("loginInfoInput success!!!!");
	}
	
	@Override
	public void loginRemove(MemberDto member) {		
		temp.delete("culturePage.loginRemove", member);
		System.out.println("loginRemove success!!!!");
	}
}
