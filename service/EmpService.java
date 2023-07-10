package in.sp.mains.service;

import java.util.List;

import org.springframework.stereotype.Service;

import in.sp.mains.entity.Employee;


public interface EmpService {

	public boolean addEmployeeService(Employee emp); 
	
	
	public List<Employee> getAllEmpDetails();
	
	public Employee authenticate(String email);
	
	public boolean deleteEmployeeService(String email);
	
	public boolean updateEmployeeService(Employee emp);
}
