package com.eams.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eams.model.PageCount;
import com.eams.model.Punch;
import com.eams.model.Statistics;
import com.eams.model.pagingTable;
import com.eams.service.PunchService;
import com.eams.service.StatisticsService;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	@Autowired
	 private StatisticsService statisticsService;
	@Autowired
	private PunchService punchService;

	@RequestMapping("/statisticsList")
	 public @ResponseBody pagingTable<List<Statistics>> getList(HttpServletRequest request){
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
		int count=statisticsService.getStatisticsCount();
		List<Statistics> list=statisticsService.getStatisticsList();
		pagingTable<List<Statistics>> table=new pagingTable<List<Statistics>>();
		table.setMsg(null);
		table.setCode(0);
		table.setData(list);
		table.setCount(count);
		return table; 
	 }

	@RequestMapping(value="/insertStatistics")
	public String insertAdept(Statistics bean) throws ParseException{
		Punch punch=new Punch();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yy = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat mm = new SimpleDateFormat("yyyy-MM-dd");

		String date=dd.format(new Date());
		Date d=dd.parse(date);
		punch.setPunch_date(d);
		Punch puncBeans=punchService.getPunchDateCount(punch);
		if(null != puncBeans && !puncBeans.equals("")){
			
		
		}
		statisticsService.insertStatistics(bean);
		
		return "adept";
	}	
	
	
}
