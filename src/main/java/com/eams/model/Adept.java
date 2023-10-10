package com.eams.model;

import java.util.List;

/**
 * 部门实体
 * @author MyBugBean
 *
 */
public class Adept {

	private Integer  adept_id;//企业部门ID
	private String  adept_name;//企业部门名称
	private String  adept_ads;//企业部门描述
	private Integer  employee_id;//员工ID
	private List<Employee> empList;
	public Integer getAdept_id() {
		return adept_id;
	}
	public void setAdept_id(Integer adept_id) {
		this.adept_id = adept_id;
	}
	public String getAdept_name() {
		return adept_name;
	}
	public void setAdept_name(String adept_name) {
		this.adept_name = adept_name;
	}
	public String getAdept_ads() {
		return adept_ads;
	}
	public void setAdept_ads(String adept_ads) {
		this.adept_ads = adept_ads;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public List<Employee> getEmpList() {
		return empList;
	}
	public void setEmpList(List<Employee> empList) {
		this.empList = empList;
	}
	
}
