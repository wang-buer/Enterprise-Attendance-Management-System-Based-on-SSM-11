package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.StatisticsDao;
import com.eams.model.Adept;
import com.eams.model.PageCount;
import com.eams.model.Statistics;
import com.eams.service.StatisticsService;

@Service("statisticsService")
public class StatisticsServiceImpl  implements 	StatisticsService{

	@Autowired
	private StatisticsDao statisticsDao;

	public List<Statistics> getStatisticsList() {

		return statisticsDao.getStatisticsList();
	}

	public Integer getStatisticsCount() {

		return statisticsDao.getStatisticsCount();
	}

	public int insertStatistics(Statistics param) {

		return statisticsDao.insertStatistics(param);
	}
	
}
