package com.eams.model;

import java.sql.Date;

/**
 * 考勤专员实体
 * @author MyBugBean
 *
 */
public class Commissioner {

	private Integer c_id;//ID
	private String c_phone;//电话
	private String c_name;//姓名
	private String c_address;//地址
	private Date create_time;//创建时间
	private  String c_codejob;//工号
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getC_codejob() {
		return c_codejob;
	}
	public void setC_codejob(String c_codejob) {
		this.c_codejob = c_codejob;
	}
	
	
}
