package com.cp.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.loginInfo.LoginInfo;
import com.cp.member.MemberDto;
import com.cp.member.dao.MemberDao;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberDao dao;
	
	@Override
	public void memberRegister(MemberDto dto) {		
		dao.memberInsert(dto);		
	}
	
	@Override
	public MemberDto memberSearch(String member_id, String member_pwd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void memberModify() {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void memberRemove() {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public MemberDto memberCheck(MemberDto dto) {
		System.out.println("MemberService login id = " + dto.getId());
		System.out.println("MemberService login pwd = " + dto.getPwd());
		MemberDto member = dao.memberCheck(dto);
		return member;
	}
	
	@Override
	public void memberRemove(MemberDto dto) {
		dao.memberRemove(dto);		
	}
	
	@Override
	public String idCheck(String id) {
		System.out.println("idCheck  id = " + id);
		String checkedId = dao.idCheck(id);
		return checkedId;
	}
	
	@Override
	public void loginInfoInput(LoginInfo login) {
		dao.loginInfoInput(login);
	}
	
	@Override
	public void loginRemove(MemberDto member) {
		dao.loginRemove(member);
		
	}
}
