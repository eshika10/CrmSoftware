package in.sp.mains.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.mains.entity.CustEnquiry;
import in.sp.mains.entity.CustFollowup;
import in.sp.mains.entity.Employee;
import in.sp.mains.model.CustEnquiryModel;
import in.sp.mains.service.CustEnquiryService;
import in.sp.mains.service.CustFollowupService;
import in.sp.mains.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustEnquiryController {
           
	@Autowired
	ProductService productService;
	
	@Autowired
	CustEnquiryService custEnquiryService;
	
	@Autowired
	CustFollowupService custFollowupService;
	
	@GetMapping("/customerEnquiryPage")
	public String openCustEnquiryPage(Model model,
			                          @RequestParam(name="redirect_success",required=false) String success,
	                                   @RequestParam(name="redirect_error",required=false) String error ){
		
		List<String> list=productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list);
		
		model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel());
		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);
		return "customer-enquiry";
	}
	
	@PostMapping("/custEnquiryForm")
	public String custEnquiryForm(HttpSession session,@ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel custEnquiryModel,
			                      RedirectAttributes redirectAttribute){
		
		LocalDate date=LocalDate.now();
		String date1=date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		
		LocalTime time=LocalTime.now();
		String time1=time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
		Employee emp=(Employee)session.getAttribute("session_emp");
		String empemail="";
		if(emp!=null) {
			empemail=emp.getEmail();
		}
		
		String phoneno=custEnquiryModel.getPhoneno();
		
		CustEnquiry custEnquiry=custEnquiryModel.getCustEnquiry();
		custEnquiry.setPhoneno(phoneno);
		custEnquiry.setEnquirydate(date1);
		custEnquiry.setEnquirytime(time1);
		custEnquiry.setEmpemail(empemail);
		
		CustFollowup custFollowup=custEnquiryModel.getCustFollowup();
		custFollowup.setPhoneno(phoneno);
		
		boolean status1=custEnquiryService.addCustEnquiryDetailsService(custEnquiry);
		boolean status2=custFollowupService.addCustFollowupDateService(custFollowup);
		
		if(status1 && status2) {
			 redirectAttribute.addAttribute("redirect_success","Customer Enquiry details added successfully");
		}else {
			redirectAttribute.addAttribute("redirect_error","Customer Enquiry details not added due to some error");
		}
		return "redirect:/customerEnquiryPage";
	}
	
	@GetMapping("/customerFollowupPage")
	public String openCustFollowupPage(@RequestParam(name="selectedDate",required=false)  String selectedDate,
			                           Model model)
	{
		
		if(selectedDate!=null) {
			
			List<CustFollowup> list_followups=custFollowupService.getFollowupForProvidedDate(selectedDate);
			model.addAttribute("model_followups", list_followups);
			
		}else {
			LocalDate ld=LocalDate.now();
			String date1=ld.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			List<CustFollowup> list_followups=custFollowupService.getFollowupForProvidedDate(date1);
			model.addAttribute("model_followups", list_followups);
		}
		
		return "customer-followup";
	}
	
	@GetMapping("/checkPhoneNumberAvailability")
	@ResponseBody
	public String checkPhoneNo(@RequestParam("phoneNumber") String phoneno){
		
		boolean status=custEnquiryService.isPhoneNoExists(phoneno);
		if(status) {
			return "exists";
		}
		return "not-exists";
	}
	
	@GetMapping("/custEnquiryHistoryPage")
	public String openCustEnquiryHistoryPage(@RequestParam("phno") String phoneno,Model model) {
	    
		List<CustEnquiry> list_enq=custEnquiryService.getAllCustHistory(phoneno);
		
    	model.addAttribute("model_enq_his", list_enq);
		model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel());
		
		List<String> list=productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list);
		return "custenq-history";
	}
}
