package com.eams.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class pagingTable<T> implements Serializable {

	private Integer code;
    private  Integer count;
    private String msg;
    private T data ;
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "pagingTable [code=" + code + ", count=" + count + ", msg=" + msg + ", data=" + data + "]";
	}


	

	
}
