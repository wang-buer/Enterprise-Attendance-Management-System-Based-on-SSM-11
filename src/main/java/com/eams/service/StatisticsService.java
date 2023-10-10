package com.eams.service;

import java.util.List;

import com.eams.model.Statistics;

public interface StatisticsService {
	public List<Statistics> getStatisticsList();
	public Integer getStatisticsCount();
	public int insertStatistics(Statistics param);
}
