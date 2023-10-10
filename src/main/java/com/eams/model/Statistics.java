package com.eams.model;
/*
 * 考勤统计实体
 */
public class Statistics {

	private Integer id;//主键
	private String eid;//员工工号
	private String e_name;//员工名称
	private String present;//是否全勤
	private String leave_day;//请假天数
	private String evection;//出差天数
	
	private String forget;//打卡汇总
	private String Forget_data;//打卡日期
	private String create_date;//创建时间
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
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public String getLeave_day() {
		return leave_day;
	}
	public void setLeave_day(String leave_day) {
		this.leave_day = leave_day;
	}
	public String getEvection() {
		return evection;
	}
	public void setEvection(String evection) {
		this.evection = evection;
	}
	public String getForget() {
		return forget;
	}
	public void setForget(String forget) {
		this.forget = forget;
	}
	public String getForget_data() {
		return Forget_data;
	}
	public void setForget_data(String forget_data) {
		Forget_data = forget_data;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

}
