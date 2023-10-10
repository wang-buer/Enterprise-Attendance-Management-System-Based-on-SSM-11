package com.eams.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.model.Adept;
import com.eams.model.PageCount;
import com.eams.model.Punch;
import com.eams.model.pagingTable;
import com.eams.service.PunchService;

@Controller
@RequestMapping("/punch")
public class PunchController {

	@Autowired
	 private PunchService punchService;

	@RequestMapping("/punchList")
	 public @ResponseBody pagingTable<List<Punch>> getList(HttpServletRequest request){
		SimpleDateFormat dd = new SimpleDateFormat("MM");
		String page=request.getParameter("page");
		String pagecount=request.getParameter("limit");
		String mm=(String)request.getParameter("keyword");
		String eid=(String)request.getParameter("eid");
		HttpSession session=request.getSession();
		String  esid= (String)session.getAttribute("eID");
		pagingTable<List<Punch>> pageList=new pagingTable<List<Punch>>();
		PageCount paBean=new PageCount();
		Integer stuaus=(Integer) session.getAttribute("stuaus");
		if(stuaus.equals(1)){
			paBean.setId(null);
		}else{
			paBean.setId(Integer.valueOf(esid));
		}
		paBean.setPageSize(Integer.valueOf(pagecount));
		paBean.setPage(Integer.valueOf(page));
		if(null != mm && !"".equals(mm)){
			paBean.setMenth(mm.split("-")[1]);
		}else{
		paBean.setMenth(dd.format(new Date()));
		}
		List<Punch> list=punchService.getPunch(paBean);
		pageList.setCode(0);
		pageList.setData(list);
		pageList.setMsg(null);
		pageList.setCount(punchService.getPunchCount());
		return pageList; 
	 }
	@RequestMapping("/punchListBean")
	 public @ResponseBody pagingTable<List<Punch>> getListBean(HttpServletRequest request){
		String page=request.getParameter("page");
		String pagecount=request.getParameter("limit");
		String id=(String)request.getParameter("keyword");
		String eid=(String)request.getParameter("eid");
		HttpSession session=request.getSession();
		String  esid= (String)session.getAttribute("eID");
		pagingTable<List<Punch>> pageList=new pagingTable<List<Punch>>();
		PageCount paBean=new PageCount();
		paBean.setId(Integer.valueOf(esid));
		paBean.setPageSize(Integer.valueOf(pagecount));
		paBean.setPage(Integer.valueOf(page));
		SimpleDateFormat dd = new SimpleDateFormat("MM");
		if(null != id && !"".equals(id)){
			paBean.setMenth(id.split("-")[1]);
		}else{
			paBean.setMenth(dd.format(new Date()));
		}
		List<Punch> list=punchService.getPunchListbean(paBean);
		pageList.setCode(0);
		pageList.setData(list);
		pageList.setMsg(null);
		pageList.setCount(punchService.getPunchCount());
		return pageList; 
	 }
	
	
	
	@RequestMapping(value="/punchPut")
	public @ResponseBody String punchput(HttpServletRequest request) throws ParseException{
		String id=request.getParameter("id");
		Punch punch=new Punch();
		Date data=new Date();
		SimpleDateFormat sb =new SimpleDateFormat("HH");
		SimpleDateFormat mm =new SimpleDateFormat("MM");
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String fdf=df.format(data);
		String HH=sb.format(data);
		int hh=Integer.valueOf(HH);
		//上午
		if(hh>6 && hh<12){
			punch.setForenoon_date(fdf);
		}else{
			punch.setAfternoon_date(fdf);
		}
		punch.setMenth(mm.format(new Date()));
		punch.setPunch_date(data);
		punch.setEmp_id(Integer.valueOf(id));
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("ename");
		punch.setEname(name);
		String nDate=dd.format(data);
		Date newdate=dd.parse(nDate);
		punch.setPunch_date(newdate);
		int insert=0;
		Punch pubchDate=punchService.selectPunchDate(punch);
		if(pubchDate != null){
			if(pubchDate.getId() !=null && !"".equals(pubchDate.getId())){
				//上午
				if(hh>6 && hh<12){
					pubchDate.setForenoon_date(fdf);
				}else{
					pubchDate.setAfternoon_date(fdf);
				}	
				pubchDate.setPunch_date(newdate);
			insert=punchService.updatePunch(pubchDate);
			}
		} else{
		 insert=	punchService.punchInsert(punch);
		}
	if(insert >0){
		return "打卡成功";	
		}else{
			
		return "打卡失败";
		}
	}
}
