package in.sp.mains.service;

import java.util.List;

import in.sp.mains.entity.CustEnquiry;

public interface CustEnquiryService {
      public boolean addCustEnquiryDetailsService(CustEnquiry custdetails);
      public boolean isPhoneNoExists(String phoneno);
      public List<CustEnquiry> getAllCustHistory(String phoneno);
}
