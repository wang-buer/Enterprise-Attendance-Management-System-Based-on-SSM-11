package com.eams.dao;

import java.util.List;
import com.eams.model.PageCount;
import com.eams.model.Punch;

public interface PunchDao {

	public List<Punch> getPunch(PageCount param );
	public int punchInsert(Punch param);
	public  Integer getPunchCount();
	public Punch selectPunchDate(Punch paran);
	public int updatePunch(Punch paran);
	public Punch getPunchDateCount(Punch param);
	public List<Punch>  getPunchListbean(PageCount param);

	
}
