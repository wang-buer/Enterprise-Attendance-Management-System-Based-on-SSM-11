package com.eams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eams.model.Commissioner;
import com.eams.service.CommissionerService;

@Controller
@RequestMapping("/comiss")
public class CommissionerController {

	@Autowired
	 private CommissionerService commissionerService;

	@RequestMapping("/comissList")
	 public String getList(ModelMap model){
		 
		 List<Commissioner> beanList=commissionerService.getLIst(null);
		 model.addAttribute("ulist",beanList);
		return "commissList"; 
	 }
	@RequestMapping(value="comInsert",produces="text/html;charset=UTF-8;")
	public  String  insConmissioner(HttpServletRequest request,HttpServletResponse response){
		String phone=(String)request.getParameter("c_phone");
		String address=(String)request.getParameter("c_address");
		String names=(String)request.getParameter("c_name");
		String jop=(String)request.getParameter("c_codejob");
		Commissioner bean=new Commissioner();

		if(null != address && !"".equals(address)){
			bean.setC_address(address);

		}
		if(null != phone && !"".equals(phone)){
			bean.setC_phone(phone);

		}
		if(null != jop && !"".equals(jop)){
			bean.setC_codejob(jop);

		}
		if(null != names && !"".equals(names)){
			bean.setC_name(names);

		}
		int insert=0;
		if(null !=bean.getC_name() && null != bean.getC_codejob() &&
			null != bean.getC_phone() && null != bean.getC_address()){
			insert=commissionerService.insrtCommissioner(bean);
		}
		String rest=null;
		if(insert >0){
			rest="插入成功";
		}else{
			rest="插入失败";
		}
		request.setAttribute("Cerroe",rest);
		return "redirect:/comiss/comissList.do";
	}
	@RequestMapping(value="/delc",produces="text/html;charset=UTF-8;")
	public  String delCommissioner(HttpServletRequest request){
	String code=(String)request.getParameter("c_codejob");
	String name=(String)request.getParameter("c_name");
	Commissioner bean=new Commissioner();
	bean.setC_codejob(code);
	bean.setC_name(name);
	int a= commissionerService.delCommissioner(bean);
	String  result =null;
		if(a>0){
			result="删除成功";
		}else{
			result="删除失败";
		}
		request.setAttribute("Cerroe",result);
	return "redirect:/comiss/comissList.do";
	}
	/**
	 * 考勤专员数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxLists",produces={"application/json;charset=UTF-8"})
	public @ResponseBody String getList(HttpServletRequest request){
		String oldEnname=request.getParameter("oldEnname");
		Commissioner cBean=new Commissioner();
		cBean.setC_codejob(oldEnname);
		List<Commissioner>  beanList=null;
		 beanList=commissionerService.getLIst(cBean);
		String msg="true";	
		 if(beanList.size()>0 ){
			 msg="false"; 
			}
			return msg;
		
		
	}
	
}
