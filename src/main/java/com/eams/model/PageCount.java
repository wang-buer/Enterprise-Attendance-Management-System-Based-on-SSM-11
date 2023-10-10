package com.eams.model;

public class PageCount {

	private Integer page;
	private Integer pageSize;
	private Integer id;
	private String name;
	private String menth;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		
		this.page = (page-1)*this.pageSize;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMenth() {
		return menth;
	}
	public void setMenth(String menth) {
		this.menth = menth;
	}
	
}
