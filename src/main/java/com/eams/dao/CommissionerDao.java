package com.eams.dao;

import java.util.List;

import com.eams.model.Commissioner;

public interface CommissionerDao {

	public  List<Commissioner> getLIst(Commissioner param);
	public int  delCommissioner(Commissioner parm);
	public int insrtCommissioner(Commissioner parm);
	public Commissioner getCommissioner(Commissioner param);
}
