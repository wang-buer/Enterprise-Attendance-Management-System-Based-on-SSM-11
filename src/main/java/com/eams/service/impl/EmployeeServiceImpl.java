package com.eams.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.eams.dao.AdeptDao;
import com.eams.dao.EmployeeDao;
import com.eams.model.Adept;
import com.eams.model.Employee;
import com.eams.model.PageCount;
import com.eams.service.EmployeeService;
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private AdeptDao adeprDao;
	public List<Employee> getEmployeeAll(PageCount param) throws DataAccessException {
	
		return employeeDao.getEmployeeAll(param);
	}

	public Employee getEmployee(Employee param) {
		
		return employeeDao.getEmployee(param);
	}

	public int insertEmployee(Employee param) {

		return employeeDao.insertEmployee(param);
	}

	public int delEmployee(Employee param) {

		return employeeDao.delEmployee(param);
	}

	public int updateEmployee(Employee param) {

		return employeeDao.updateEmployee(param);
	}

	public Integer getCount() {

		return employeeDao.getCount();
	}

	public List<Adept> getAdeptCode() {

		return adeprDao.getAdeptCode();
	}

}
