package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.CommissionerDao;
import com.eams.model.Commissioner;
import com.eams.service.CommissionerService;

@Service("commissionerService")
public class CommissionerServiceImpl implements CommissionerService {

	@Autowired
	 private CommissionerDao commissionerDao;
	public List<Commissioner> getLIst(Commissioner param) {

		
		return commissionerDao.getLIst(param);
	}

	public int delCommissioner(Commissioner parm) {

		return commissionerDao.delCommissioner(parm);
	}

	public int insrtCommissioner(Commissioner parm) {

		return commissionerDao.insrtCommissioner(parm);
	}

	public Commissioner getCommissioner(Commissioner param) {

		return commissionerDao.getCommissioner(param);
	}

}
