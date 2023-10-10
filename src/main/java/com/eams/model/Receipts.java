package com.eams.model;

import java.util.Date;

/**
 * 单据实体
 * @author MyBugBean
 *
 */
public class Receipts {
	
	private Integer id;//主键
	private String eid;//员工工号ID
	private String start_time;//开始时间
	private String end_time;//结束时间
	private String ename;//员工姓名
	private String leave_type;//请假类别
	private String leave_day;//请假天数
	private String describes;//描述
	private String evection_day;//出差天数
	private String forget_data;//忘记打卡时间
	private String affert_data;//上午实际打卡时间
	private String afternoon_data;//下午实际打卡时间
	private String site;//出差地点
	private Date create_data;//创建时间
	private String expense;//预支费用
	private String e_status;//审核状态
	private String status_name;//审批
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getLeave_type() {
		return leave_type;
	}
	public void setLeave_type(String leave_type) {
		this.leave_type = leave_type;
	}
	public String getLeave_day() {
		return leave_day;
	}
	public void setLeave_day(String leave_day) {
		this.leave_day = leave_day;
	}

	public String getDescribes() {
		return describes;
	}
	public void setDescribes(String describes) {
		this.describes = describes;
	}
	public String getEvection_day() {
		return evection_day;
	}
	public void setEvection_day(String evection_day) {
		this.evection_day = evection_day;
	}
	public String getForget_data() {
		return forget_data;
	}
	public void setForget_data(String forget_data) {
		this.forget_data = forget_data;
	}
	public String getAffert_data() {
		return affert_data;
	}
	public void setAffert_data(String affert_data) {
		this.affert_data = affert_data;
	}
	public String getAfternoon_data() {
		return afternoon_data;
	}
	public void setAfternoon_data(String afternoon_data) {
		this.afternoon_data = afternoon_data;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public Date getCreate_data() {
		return create_data;
	}
	public void setCreate_data(Date create_data) {
		this.create_data = create_data;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public String getE_status() {
		return e_status;
	}
	public void setE_status(String e_status) {
		this.e_status = e_status;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	
}
