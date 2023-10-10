package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.AdeptDao;
import com.eams.model.Adept;
import com.eams.model.PageCount;
import com.eams.service.AdeptService;

@Service("adeptService")
public class AdeptServiceImpl  implements 	AdeptService{

	@Autowired
	private AdeptDao adeptDao;
	public List<Adept> getAdeptList( PageCount param) {

		return adeptDao.getAdeptList(param);
	}

	public Adept getAdept(Integer param) {

		return adeptDao.getAdept(param);
	}

	public List<Adept> getAdeptCode() {

		return adeptDao.getAdeptCode();
	}

	public int delAdept(Integer param) {

		return adeptDao.delAdept(param);
	}

	public Integer getAdeptCount() {

		return adeptDao.getAdeptCount();
	}

	public int updateAdept(Adept param) {

		return adeptDao.updateAdept(param);
	}

	public int insertAdept(Adept param) {

		return adeptDao.insertAdept(param);
	}

}
