package in.sp.mains.model;

import in.sp.mains.entity.CustEnquiry;
import in.sp.mains.entity.CustFollowup;


//Whenever we required to use the two different entities we create the model class and create the objects of that two entities.
public class CustEnquiryModel {

	private String phoneno;
	private CustEnquiry custEnquiry;
	private CustFollowup custFollowup;
	
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public CustEnquiry getCustEnquiry() {
		return custEnquiry;
	}
	public void setCustEnquiry(CustEnquiry custEnquiry) {
		this.custEnquiry = custEnquiry;
	}
	public CustFollowup getCustFollowup() {
		return custFollowup;
	}
	public void setCustFollowup(CustFollowup custFollowup) {
		this.custFollowup = custFollowup;
	}
	
}
