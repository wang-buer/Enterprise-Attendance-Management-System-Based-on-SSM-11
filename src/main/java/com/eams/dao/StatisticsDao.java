package com.eams.dao;

import java.util.List;

import com.eams.model.Statistics;

public interface StatisticsDao {

	public List<Statistics> getStatisticsList();
	public Integer getStatisticsCount();
	public int insertStatistics(Statistics param);
	
}
