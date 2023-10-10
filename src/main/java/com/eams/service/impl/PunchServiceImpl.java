package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.PunchDao;
import com.eams.model.PageCount;
import com.eams.model.Punch;
import com.eams.service.PunchService;

@Service("punchService")
public class PunchServiceImpl  implements 	PunchService{

	@Autowired
	private PunchDao punchDao;
	public List<Punch> getPunch(PageCount param) {

		return punchDao.getPunch(param);
	}

	public int punchInsert(Punch param) {

		return punchDao.punchInsert(param);
	}

	public Integer getPunchCount() {

		return punchDao.getPunchCount();
	}

	public Punch selectPunchDate(Punch paran) {

		return punchDao.selectPunchDate(paran);
	}

	public int updatePunch(Punch paran) {

		return punchDao.updatePunch(paran);
	}

	public Punch getPunchDateCount(Punch param) {

		return punchDao.getPunchDateCount(param);
	}

	public List<Punch>  getPunchListbean(PageCount param) {

		return punchDao.getPunchListbean(param);
	}

	

}
