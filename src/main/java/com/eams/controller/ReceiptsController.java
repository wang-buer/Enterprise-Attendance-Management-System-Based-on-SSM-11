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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.model.PageCount;
import com.eams.model.Punch;
import com.eams.model.Receipts;
import com.eams.model.pagingTable;
import com.eams.service.PunchService;
import com.eams.service.ReceiptsService;

@Controller
@RequestMapping("/receipt")
public class ReceiptsController {

	@Autowired
	 private ReceiptsService receiptService;
	@Autowired
	 private PunchService punchService;

	@RequestMapping("/receiptList")
	 public @ResponseBody pagingTable<List<Receipts>> getList(HttpServletRequest request){
		String page=request.getParameter("page");
		String pagecount=request.getParameter("limit");
		HttpSession  session=request.getSession();
		String id=(String)session.getAttribute("eID");
		Integer stuaus=(Integer)session.getAttribute("stuaus");
		PageCount pages=new PageCount();
		pages.setPageSize(Integer.valueOf(pagecount));
		pages.setPage(Integer.valueOf(page));
		if(stuaus.equals(1)){
			pages.setId(null);
		}else{
		if(null != id && !"".equals(id)){
			pages.setId(Integer.valueOf(id));
		}
		}
		int count=receiptService.getReceiptsCount();
		List<Receipts> list=receiptService.getReceiptsList(pages);
		pagingTable<List<Receipts>> table=new pagingTable<List<Receipts>>();
		table.setMsg(null);
		table.setCode(0);
		table.setData(list);
		table.setCount(count);
		return table; 
	 }
	@RequestMapping(value="/delReceipt")
	public String delreceipt(@RequestParam("id") Integer id){
		
		receiptService.delReceipts(id);
		return "success";
	}

	/**
	 * @param bean
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/insertReceipt")
	public String insertReceipt(Receipts bean,HttpServletRequest request) throws ParseException{
		bean.setCreate_data(new Date());
		bean.setE_status("0");
		bean.setStatus_name("未审批");	
		int isnert=receiptService.insertReceipts(bean);
		Punch pbean=new Punch();
		String data=bean.getForget_data();
		SimpleDateFormat sb=new SimpleDateFormat("yyyy-MM-dd");
		if(null !=data && !data.equals("") ){
			pbean.setPunch_date(sb.parse(data));//日期
		}
		String aff=bean.getAffert_data();//上午
		String afrt=bean.getAfternoon_data();//下午
		if(aff != null && !"".equals(aff)){
			pbean.setForenoon_date(aff);
		}
		if(null !=afrt &&  !"".equals(afrt)){
			pbean.setAfternoon_date(afrt);
		}		
		HttpSession session=request.getSession();
		session.setAttribute("aff",aff);//上
		session.setAttribute("afrt",afrt);//下
		session.setAttribute("pdata",data);

		if(isnert>0){
			request.setAttribute("suStauts","插入成功");
		}else{
			request.setAttribute("suStauts","插入失败");
		}
		return "success";
	}
	@RequestMapping("/updateReceipt")
	public @ResponseBody String updateReceipt(HttpServletRequest request) throws ParseException{
		Receipts param=new Receipts();
		String id=request.getParameter("id");
		String eid=request.getParameter("eId");
		param.setId(Integer.valueOf(id));
		param.setEid(eid);
		param.setE_status("1");
		param.setStatus_name("已审批");
		HttpSession session=request.getSession();
		//String aff=(String)session.getAttribute("aff");
		//String afrt=(String)session.getAttribute("afrt");
		//String pdata=(String)session.getAttribute("pdata");
		String aff=request.getParameter("aff");
		String afrt=request.getParameter("afrt");
		String pdata=request.getParameter("pdata");
		Punch pbean=new Punch();
		SimpleDateFormat sb=new SimpleDateFormat("yyyy-MM-dd");
		if(null !=pdata && !pdata.equals("") ){
			pbean.setPunch_date(sb.parse(pdata));//日期
		}
		if(aff != null && !"".equals(aff)){
			pbean.setForenoon_date(pdata+" "+aff);
		}
		if(null !=afrt &&  !"".equals(afrt)){
			pbean.setAfternoon_date(pdata+" "+afrt);
		}
		 	punchService.updatePunch(pbean);
			receiptService.updateReceipts(param);
	
		
		return "审批成功";
	}
	@RequestMapping("/sedReceipt")
	public @ResponseBody String sedzeReceipt(){
		
		
		return "receiptsList";
	} 
	
}
