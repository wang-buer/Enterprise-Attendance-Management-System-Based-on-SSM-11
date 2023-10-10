package com.eams.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.eams.model.Employee;
import com.eams.model.PageCount;
/**
 * 员工数据处理
 * @author MyBugBean
 *
 */
public interface EmployeeDao {

		public List<Employee> getEmployeeAll(PageCount param) throws DataAccessException;
		public Employee getEmployee(Employee param);
		public int   insertEmployee(Employee param);
		public int delEmployee(Employee param);
		public int updateEmployee(Employee param);
		public  Integer getCount();
}
