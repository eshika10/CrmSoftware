package in.sp.mains.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.mains.entity.Employee;
import in.sp.mains.entity.Product;
import in.sp.mains.entity.SaleCourse;
import in.sp.mains.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
    
	@Autowired
	ProductService productService;
	
	@GetMapping("/addProducts")
	public String openAddProductsPage(Model model,
			     @RequestParam(name="redirect_attr_success",required=false) String success,
			     @RequestParam(name="redirect_attr_error",required=false)String error) {
		
		model.addAttribute("productAttr", new Product());
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		return "add-products";
	}
	
	@PostMapping("/addCourseForm")
	public String addCourseDetails(@ModelAttribute("productAttr") Product product,
			                       @RequestParam("courseimage") MultipartFile courseImage,
			                       @RequestParam("trainersimage") MultipartFile trainersImage,
			                       RedirectAttributes redirectAttributes) 
	{
		boolean status1=saveImage(courseImage);
		if(!status1){
			System.out.println("course image not uploaded ");
		}
		boolean status2=saveImage(trainersImage);
		if(!status2){
			System.out.println("trainer image not uploaded ");
		}
		
		boolean status=productService.addProductService(product);
		if(status) {
			redirectAttributes.addAttribute("redirect_attr_success","Course added successfully");
		}else {
			redirectAttributes.addAttribute("redirect_attr_error","Course do not added due to some error");
		}
		return "redirect:/addProducts";
	}
	
	private boolean saveImage(MultipartFile file){
		boolean status=false;
		
		try {
			
			String fileName=file.getOriginalFilename();
			Path path=Paths.get("src/main/resources/static/uploads",fileName);
			Files.copy(file.getInputStream(), path,StandardCopyOption.REPLACE_EXISTING);
			status=true;
			
		}catch(Exception e) {
			e.printStackTrace();
			status=false;
		}
		return status;
	}
	
	@GetMapping("/productsList")
	public String openProductListPage(Model model) {
		 boolean status=false;
		 try {
			List<Product> list= productService.getAllProductsListService();
			model.addAttribute("model_product_details",list);
			status=true;
		 }
		 catch(Exception e) {
			 e.printStackTrace();
			 status=false;
		 }
		 return "product-list";
	}
	
	@GetMapping("/courseDetails")
	public String openCourseDetailsPage(@RequestParam("courseName") String coursename,Model model) {
		
		Product product=productService.getProductDetailsService(coursename);
		model.addAttribute("model_product_details", product);
		return"course_details";
	}
	
	@GetMapping("/saleCourse")
	public String openSaleCoursePage(Model model,
			                         @RequestParam(name="redirectAttr_success",required=false) String success,
			                         @RequestParam(name="redirectAttr_error",required=false) String error){
		
		List<String> list=productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list);
		
		model.addAttribute("modelSaleCourseAtt",new SaleCourse());
		
		model.addAttribute("model_success",success);
		model.addAttribute("model_error",error);
		return "sale-course";
	}
	
	@GetMapping("/getCoursePrices")
	@ResponseBody
	public Product getCoursePrices(@RequestParam("selectedcourse") String selectedcourse){
		
		return productService.getSelectedCourseDetails(selectedcourse);
	}
	
	@PostMapping("/saleCourseForm")
	public String saleCourseForm(HttpSession session,@ModelAttribute("modelSaleCourseAtt") SaleCourse saleCourse,RedirectAttributes redirectAttributes) {
		
		Employee employee=(Employee)session.getAttribute("session_emp");
		String empemail=employee.getEmail();
		
		LocalDate ld= LocalDate.now();
		String date1=ld.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		
		LocalTime lt=LocalTime.now();
		String time1=lt.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
		saleCourse.setEmpemailid(empemail);
		saleCourse.setDate(date1);
		saleCourse.setTime(time1);
		
		boolean status=productService.addSaleCourseDetails(saleCourse);
		if(status) {
			 redirectAttributes.addAttribute("redirectAttr_success","Course Sale Successfully");
		}else {
			redirectAttributes.addAttribute("redirectAttr_error","Course do not Sale due to some error");
		}
		
		return "redirect:/saleCourse";
	}
}
