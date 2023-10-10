package com.eams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.dao.AdeptDao;
import com.eams.model.Adept;
import com.eams.model.Commissioner;
import com.eams.model.PageCount;
import com.eams.model.pagingTable;
import com.eams.service.AdeptService;

@Controller
@RequestMapping("/adept")
public class AdeptController {

	@Autowired
	 private AdeptService adeptService;

	@RequestMapping("/adeptList")
	 public @ResponseBody pagingTable<List<Adept>> getList(HttpServletRequest request){
		String page=request.getParameter("page");
		String pagecount=request.getParameter("limit");
		String id=(String)request.getParameter("keyword");
		String name=(String)request.getParameter("keywordname");
		PageCount pages=new PageCount();
		pages.setPageSize(Integer.valueOf(pagecount));
		pages.setPage(Integer.valueOf(page));
		if(null != id && !"".equals(id)){
			pages.setId(Integer.valueOf(id));
		}
		if(null != name && !"".equals(name)){
			pages.setName(name);
		}
		int count=adeptService.getAdeptCount();
		List<Adept> list=adeptService.getAdeptList(pages);
		pagingTable<List<Adept>> table=new pagingTable<List<Adept>>();
		table.setMsg(null);
		table.setCode(0);
		table.setData(list);
		table.setCount(count);
		return table; 
	 }
	@RequestMapping(value="/delAdept")
	public String delAdept(@RequestParam("id") Integer id){
		
		adeptService.delAdept(id);
		return "adept";
	}
	@RequestMapping(value="/updateAdept")
	public String updateAdept(Adept bean){
		adeptService.updateAdept(bean);
		return "adept";
	}
	@RequestMapping(value="/insertAdept")
	public String insertAdept(Adept bean){
		
		adeptService.insertAdept(bean);
		
		return "adept";
	}	
	@RequestMapping(value="/upserAdept")
	public String upSerseAdept(HttpServletRequest request){
	String adeptId=	request.getParameter("adept_id");
	String adeptName=	request.getParameter("adept_name");
	String adeptades=request.getParameter("adept_ads");

	request.setAttribute("adeptId",adeptId);
	request.setAttribute("adeptName",adeptName);
	request.setAttribute("adeptades",adeptades);

		return "adeptupdate";
	}	
	
}
