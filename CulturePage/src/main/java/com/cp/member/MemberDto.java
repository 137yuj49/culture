package com.cp.member;

import java.time.LocalDateTime;

public class MemberDto {
	private String id;
	private String email;
	private String pwd;
	private String name;
	private LocalDateTime registerDateTime;		

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getRegisterDateTime() {
		return registerDateTime;
	}

	public void setRegisterDateTime(LocalDateTime registerDateTime) {
		this.registerDateTime = registerDateTime;
	}

	public boolean matchPassword(String pwd) {		
		return this.pwd.equals(pwd);
	}
	
	public boolean isPasswordEqualToConfirmPassword() {
		return false;
	}
}
