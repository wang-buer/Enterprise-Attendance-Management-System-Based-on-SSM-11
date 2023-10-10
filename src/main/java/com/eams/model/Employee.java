package com.eams.model;


import java.util.Date;
/**
 * 员工实体
 * @author MyBugBean
 *
 */
public class Employee {
	private  int employee_id;//员工主键ID 
	private String employee_name;//员工名称
	private int adept_code;//部门ID
	private String sex;//性别
	private String phone;//电话
	private Date join_time;//加入时间
	private String  number;//身份证号
	private Date create_time;//创建时间
	private Adept Adepts =new Adept(); //所在部门
	private String employee_number;//员工工号
	private String deptname;//所属部门
	private int pageSize;//每个数量
	private int page;//起始页
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public int getAdept_code() {
		return adept_code;
	}
	public void setAdept_code(int adept_code) {
		this.adept_code = adept_code;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoin_time() {
		return join_time;
	}
	public void setJoin_time(Date join_time) {
		this.join_time = join_time;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Adept getAdepts() {
		return Adepts;
	}
	public void setAdepts(Adept adepts) {
		Adepts = adepts;
	}
	public String getEmployee_number() {
		return employee_number;
	}
	public void setEmployee_number(String employee_number) {
		this.employee_number = employee_number;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	
}
