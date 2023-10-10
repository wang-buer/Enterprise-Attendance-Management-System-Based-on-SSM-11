package com.eams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.model.User;
import com.eams.model.pagingTable;
import com.eams.service.CommissionerService;
import com.eams.service.EmployeeService;
import com.eams.service.UserService;

/**
 * web层
 * @author MyBugBean
 *
 */
@Controller
@RequestMapping("/login")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private CommissionerService commissionerService;
	@Autowired
	private EmployeeService employeeService;
	@RequestMapping("/user")
	public String login(User user,HttpServletRequest request,ModelMap madel){
		User bean=new User();
		if( null !=user){						
			bean.setPassWord(user.getPassWord());
			bean.setLoginId(user.getLoginId());
		}
		User  userBean= userService.login(bean);
		if(null != userBean){
			madel.addAttribute("eBean",userBean);
			madel.addAttribute("roleBean",userBean);
			 HttpSession session= request.getSession();
			 session.setAttribute("eID",userBean.getJob_number());
			 session.setAttribute("teID",userBean.getJob_number());
			 session.setAttribute("ename", userBean.getLogin_name());
			 session.setAttribute("stuaus",userBean.getG_role_status());
			return "main";
		}else{
			request.setAttribute("loginErro","用户名或密码错误");
			return "login";
		}
	}
	@RequestMapping("/userList")
	public @ResponseBody pagingTable<List<User>> loginList(HttpServletRequest request){
		User bean=new User();
		String page=request.getParameter("page");
		String pagecount=request.getParameter("limit");
		String id=(String)request.getParameter("keyword");
		String name=(String)request.getParameter("keywordname");
		if(null != id || "".equals(id)){
			bean.setJob_number(id);
		}
		if(null != name || "".equals(name)){
			bean.setLogin_name(name);
		}
		bean.setPageSize(Integer.valueOf(pagecount));
		bean.setPage(Integer.valueOf(page));
		List<User>  userList= userService.loginList(bean);
		Integer count=userService.selectcountUser();
		pagingTable<List<User>> table=new pagingTable<List<User>>();
		table.setCode(0);
		table.setCount(count);
		table.setData(userList);
		table.setMsg(null);
		return table;
	}	
	@RequestMapping("/usertab")
	public String loginSystem(){
		return "systemUser";
	}	
	
	@RequestMapping(value="userInsert",produces="text/html;charset=UTF-8;")
	public @ResponseBody String  insertUser(HttpServletRequest request){
		String job_number=request.getParameter("job_number");
		String login_name=request.getParameter("login_name");
		String loginId=request.getParameter("loginId");
		String passWord=request.getParameter("passWord");
		String selectName=request.getParameter("selectName");
		User param=new User();	
		int roleStatus=Integer.valueOf(selectName);
		param.setG_role_status(roleStatus);
		if(roleStatus ==1){
			param.setRole_name("管理员");
		}else{
			param.setRole_name("员工");
		}
		param.setLogin_name(login_name);
		param.setJob_number(job_number);
		param.setLoginId(loginId);
		param.setPassWord(passWord);
		int insert=userService.insertUser(param);
		String restult=null;
		if(insert >0){
			restult="插入成功";
		}else{
			restult="插入失败";
		}
	return restult;	
	}
	@RequestMapping(value="updateuser")
	public @ResponseBody String updateUser(HttpServletRequest request){
	
		String id=request.getParameter("id");
		String job_number=request.getParameter("job_number");
		String login_name=request.getParameter("login_name");
		String loginId=request.getParameter("loginId");
		String passWord=request.getParameter("passWord");
		String selectName=request.getParameter("selectName");
		User param=new User();	
		int roleStatus=Integer.valueOf(selectName);
		param.setG_role_status(roleStatus);
		if(roleStatus ==1){
			param.setRole_name("管理员");
		}else{
			param.setRole_name("员工");
		}
		param.setId(Integer.valueOf(id));
		param.setLogin_name(login_name);
		param.setJob_number(job_number);
		param.setLoginId(loginId);
		param.setPassWord(passWord);		
		int update=userService.updateUser(param);
		if(update>0){
			return "更新成功";
		}else{
		return "更新失败" ;
		}
	}
	@RequestMapping(value="delUser")
	@ResponseBody
	public String  deluser(HttpServletRequest request){
		String id=request.getParameter("userId");
		User param=new User();
		param.setId(Integer.valueOf(id));
		int del =userService.delUser(param);
		if(del >0){
			return "删除成功";
		}else{
			return "删除失败";
		}
		
	} 	
	@RequestMapping(value="selectList")
	public String   getdioUser(HttpServletRequest request){
		String id=request.getParameter("id");
		String job_number=request.getParameter("job_number");
		String login_name=request.getParameter("login_name");
		String loginId=request.getParameter("loginId");
		String passWord=request.getParameter("passWord");
		String role_name=request.getParameter("role_name");
		String statusAdd=request.getParameter("statusAdd");
		request.setAttribute("id", id);
		request.setAttribute("job_number", job_number);
		request.setAttribute("login_name", login_name);
		request.setAttribute("loginId", loginId);
		request.setAttribute("passWord", passWord);
		request.setAttribute("role_name", role_name);
		request.setAttribute("statusAdd", statusAdd);
		return "userInsert";
	} 
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
}
