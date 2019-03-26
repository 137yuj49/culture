package com.cp.show;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ShowDto {
	private int show_no;
	private String show_id;
	private String show_name;
	private int show_fee;	
	private String show_mdate;
	private String show_genre;
	private String show_phone;
	private String show_picture;
	private int concerthall_id;	
	private MultipartFile upload_f;
	
	
	public MultipartFile getUpload_f() {
		return upload_f;
	}
	public void setUpload_f(MultipartFile upload_f) {
		this.upload_f = upload_f;
	}
	public int getShow_no() {
		return show_no;
	}
	public void setShow_no(int show_no) {
		this.show_no = show_no;
	}	
	public String getShow_id() {
		return show_id;
	}
	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}
	public String getShow_name() {
		return show_name;
	}
	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}
	public int getShow_fee() {
		return show_fee;
	}
	public void setShow_fee(int show_fee) {
		this.show_fee = show_fee;
	}	
	public String getShow_mdate() {
		return show_mdate;
	}
	public void setShow_mdate(String show_mdate) {
		this.show_mdate = show_mdate;
	}
	public String getShow_genre() {
		return show_genre;
	}
	public void setShow_genre(String show_genre) {
		this.show_genre = show_genre;
	}
	public String getShow_phone() {
		return show_phone;
	}
	public void setShow_phone(String show_phone) {
		this.show_phone = show_phone;
	}
	public String getShow_picture() {
		return show_picture;
	}
	public void setShow_picture(String show_picture) {
		this.show_picture = show_picture;
	}
	public int getConcerthall_id() {
		return concerthall_id;
	}
	public void setConcerthall_id(int concerthall_id) {
		this.concerthall_id = concerthall_id;
	}
	
}
