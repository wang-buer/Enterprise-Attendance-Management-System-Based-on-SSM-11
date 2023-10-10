package com.eams.model;

import java.util.Date;

/**
 * 打卡实体
 * @author MyBugBean
 *
 */
public class Punch {

	private String forenoon_date;//上午打卡时间
	private String afternoon_date;//下午打开时间
	private Integer emp_id;//员工工号
	private Integer id;
	private Date punch_date;//当天日期
	private  int forenoonCount;
	private int afternoonCount;
	private String ename;
	private String menth;
	public int getForenoonCount() {
		return forenoonCount;
	}
	public void setForenoonCount(int forenoonCount) {
		this.forenoonCount = forenoonCount;
	}
	public int getAfternoonCount() {
		return afternoonCount;
	}
	public void setAfternoonCount(int afternoonCount) {
		this.afternoonCount = afternoonCount;
	}
	public String getForenoon_date() {
		return forenoon_date;
	}
	public void setForenoon_date(String forenoon_date) {
		this.forenoon_date = forenoon_date;
	}
	public String getAfternoon_date() {
		return afternoon_date;
	}
	public void setAfternoon_date(String afternoon_date) {
		this.afternoon_date = afternoon_date;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getPunch_date() {
		return punch_date;
	}
	public void setPunch_date(Date punch_date) {
		this.punch_date = punch_date;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getMenth() {
		return menth;
	}
	public void setMenth(String menth) {
		this.menth = menth;
	}
	
}
