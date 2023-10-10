package com.eams.controller;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.model.Adept;
import com.eams.model.Employee;
import com.eams.model.PageCount;
import com.eams.model.pagingTable;
import com.eams.service.EmployeeService;
@Controller
@RequestMapping("/getEmpList")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	@RequestMapping("/getemList")
	@DateTimeFormat
	public @ResponseBody pagingTable<List<Employee>>  getEmployList(@RequestParam("page") String page,@RequestParam("limit") String pageSize,HttpServletRequest request){
	
		pagingTable<List<Employee>> beantable =null;
		try {
		String id=(String)request.getParameter("keyword");
		String name=(String)request.getParameter("keywordname");
		PageCount bean=new PageCount();
	if(null != id && !"".equals(id)){
		bean.setId(Integer.valueOf(id));	
	}
	if(null !=  name && !"".equals(name) ){
		bean.setName(name);
	}
	bean.setPageSize(Integer.valueOf(pageSize));
	bean.setPage(Integer.valueOf(page));
	List<Employee> list;
	
		list = employeeService.getEmployeeAll(bean);
		int count=	employeeService.getCount();
		 beantable=new pagingTable<List<Employee>>();
		beantable.setCode(0);
		beantable.setData(list);
		beantable.setMsg("");
		beantable.setCount(count);
		
	} catch (DataAccessException e) {
		
		e.printStackTrace();
	}
	return beantable;
	}
	@RequestMapping(value="/upEmplo")
	public String updateEmployee(Employee bean){
		if(null != bean){
		int update=	employeeService.updateEmployee(bean);

		}				
		return "employee";
	}
	@RequestMapping(value="/insertEmplo")
	public String insertEmployee(Employee bean){
		bean.setJoin_time(new Date());
		employeeService.insertEmployee(bean);
		return "employee";
	}
	@RequestMapping(value="/delEmplo")
	public @ResponseBody String deleEmployee(@RequestParam("employee_id") Integer employee_id){
		Employee bean =new Employee();
		bean.setEmployee_id(employee_id);
		int del=employeeService.delEmployee(bean);
		if(del >0){
			return "删除成功";
		}else{
			return "删除失败";	
		}
	}
	/**
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/selectUpdateEmplo")
	public String selectEmployee(HttpServletRequest request){
		String employee_name=request.getParameter("employee_name");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");
		String join_time=request.getParameter("join_time");
		String number=request.getParameter("number");
		String deptname=request.getParameter("deptname");
		String employee_id=request.getParameter("employee_id");
		String adept_code=request.getParameter("adept_code");
		request.setAttribute("employee_name",employee_name );
		request.setAttribute("sex",sex );
		request.setAttribute("phone",phone);
		request.setAttribute("join_time",join_time);
		request.setAttribute("number",number);
		request.setAttribute("deptname",deptname );
		request.setAttribute("employee_id",employee_id );
		request.setAttribute("adept_code",adept_code );
		return "updateEmployee";
	}
	@RequestMapping(value="/selectOption")
	public @ResponseBody List<Adept> getselectList(){			
		return employeeService.getAdeptCode();
	}
}
