package com.eams.model;
/**
 * 用户实体
 * @author MyBugBean
 *
 */
public class User {

	private Integer id;
	private String loginId;//登陆ID
	private Integer deptId;//部门ID
	private String passWord;//密码
	private String deptCode;//部门编号
	private Integer g_role_status;//状态
	private Integer employee_id;//员工ID
	private Integer c_id;//考勤专员ID
	private String login_name;//员工姓名
	private String job_number;//员工工号
	private String role_name;//角色名称
	private Integer pageSize;//每个数量
	private Integer page;//起始页
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public Integer getG_role_status() {
		return g_role_status;
	}
	public void setG_role_status(Integer g_role_status) {
		this.g_role_status = g_role_status;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getJob_number() {
		return job_number;
	}
	public void setJob_number(String job_number) {
		this.job_number = job_number;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		
		this.page = (page-1)*this.pageSize;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", loginId=" + loginId + ", deptId=" + deptId + ", passWord=" + passWord
				+ ", deptCode=" + deptCode + ", g_role_status=" + g_role_status + ", employee_id=" + employee_id
				+ ", c_id=" + c_id + ", login_name=" + login_name + ", job_number=" + job_number + ", role_name="
				+ role_name + "]";
	}
	
	
	
}
