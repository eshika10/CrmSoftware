package in.sp.mains.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.mains.entity.Employee;
import in.sp.mains.service.EmpService;
import in.sp.mains.service.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@ComponentScan 
public class MainControllers {
	
	@Autowired
	EmpService empService;
	
	@Autowired
	ProductService productService;

	@GetMapping("/")
	public String openIndexPage() {
		
		return "index";
	}
	
	@GetMapping("/home")
	public String openHomePage() {
		
		return "index";
	}
	
	@GetMapping("/login")
	public String openLoginPage() {
		
		return "login";
	}
	
	int Page_size=5;
	@GetMapping("/emplist")
	public String openEmpListPage(Model model,@RequestParam(defaultValue="1")int page,
			                      @RequestParam(name="redirectAttr_success",required=false) String success,
			                      @RequestParam(name="redirectAttr_error",required=false) String error) {
		
		List<Employee> emp_list=empService.getAllEmpDetails();
		
		int total_products=emp_list.size();
		int total_pages=(int)Math.ceil((double)total_products/Page_size);
		int start_index=(page-1)*Page_size;
		int end_index=Math.min(total_products, start_index+Page_size);
		
		List<Employee> new_emp_list=emp_list.subList(start_index, end_index);
		
		model.addAttribute("model_emp_details", new_emp_list);
		model.addAttribute("model_total_pages",total_pages);
		model.addAttribute("model_current_page",page);
		
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		
		return "EmployeesList";
	}
	
	@GetMapping("/profile-admin")
	public String openAdminPage() {
		
		return "profile-admin";
	}
	
	@PostMapping("/loginForm")
	public String loginForm(
		@RequestParam("email1") String myemail,
		                @RequestParam("pass1")String mypass,Model model,HttpSession  session 
			) {
		
		String page="login";
		
		if(myemail.equals("admin@gmail.com")&& mypass.equals("admin123")){
			page="profile-admin";
		}else {
			Employee emp=empService.authenticate(myemail);
			if(emp!=null && emp.getPassword().equals(mypass)){
				session.setAttribute("session_emp",emp);
				
				page="home-employee";
			}else {
				model.addAttribute("model_error","Email id and Password did'nt match");
				page="login";
			}
		}
		
		return page;
	}
	
	@GetMapping("/addEmpdetails")
	public String addEmpPage(Model model) {
		
		model.addAttribute("modelEmpAtt",new Employee());
		return "addEmp";
	}
	
	@PostMapping("/addEmpForm")
	public String addEmpSuccess(@Valid @ModelAttribute("modelEmpAtt") Employee emp,
			                    BindingResult br,
			                    Model model
			) {
		         
		         
		       if(!br.hasErrors()) {
		    	   boolean status=empService.addEmployeeService(emp);
			         if(status){
			        	 model.addAttribute("model_success","Employee added successfully");
			         }else {
			        	 model.addAttribute("model_error","Employee do not added due to some error");
			         }
			         emp.setName(" ");
			         emp.setEmail(" ");
			         emp.setPassword(" ");
			         emp.setPhoneno(" ");
		       }
		
		return "addEmp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "login";
	}
	
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("empEmail") String email,RedirectAttributes redirectAttributes) {
		
		boolean status= empService.deleteEmployeeService(email);
		 if(status) {
			 redirectAttributes.addAttribute("redirectAttr_success","Employee deleted successfully");
		 }else {
			 redirectAttributes.addAttribute("redirectAttr_error","Employee do not deleted due to some error"); 
		 }
		return "redirect:/emplist";
	}
	
	@GetMapping("/editEmployee")
	public String openEditEmpPage(@RequestParam("empEmail") String email,Model model) {
		Employee emp=empService.authenticate(email);
		
		model.addAttribute("modelEmpAtt",new Employee());
		model.addAttribute("model_emp",emp);
		
		return "edit-employee";
	}
	
	@PostMapping("/updateEmpForm")
	public String UpdateEmpSuccess(@Valid @ModelAttribute("modelEmpAtt") Employee emp,
			                    BindingResult br,
			                    Model model
			) {
		         
		         
		       if(!br.hasErrors()) {
		    	   boolean status=empService.updateEmployeeService(emp);
			         if(status){
			        	 model.addAttribute("model_success","Employee updated successfully");
			         }else {
			        	 model.addAttribute("model_error","Employee do not updated due to some error");
			         }
			         emp.setName(" ");
			         emp.setEmail(" ");
			         emp.setPassword(" ");
			         emp.setPhoneno(" ");
		       }
		
		return "edit-employee";
	}
	
	@GetMapping("/profileEmployee")
	public String openEmpProfilePage() {
		
		return "profile-employee";
	}
	
	@GetMapping("/homeEmployee")
	public String openEmpHomePage(Model model) {
		
		List<Object[]> list=productService.getPurchasedCourseCountService();
		model.addAttribute("model_graphlist", list);
		return "home-employee";
	}
}

//<%
//String login_error=(String)request.getAttribute("model_error");
//%>

//<%
//if(login_error!=null){
//	
//   %>
//       <h5 style="color:red;"><%=login_error %></h5>
//   <%
//}
//%>
//<a href="deleteEmp"> <input class="bi bi-trash3-fill" name="delete"></input> </a>