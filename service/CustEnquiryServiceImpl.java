package in.sp.mains.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.mains.entity.CustEnquiry;
import in.sp.mains.repository.CustEnquiryRepository;

@Service
public class CustEnquiryServiceImpl implements CustEnquiryService {

	@Autowired
	CustEnquiryRepository custEnquiryRepository;
	
	@Override
	public boolean addCustEnquiryDetailsService(CustEnquiry custdetails){
		
		boolean status=false;
		try {
			custEnquiryRepository.save(custdetails);
			status=true;
		}catch(Exception e){
			e.printStackTrace();
			status=false;
		}
		return status;
	}

	@Override
	public boolean isPhoneNoExists(String phoneno) {
		
		return custEnquiryRepository.existsByPhoneno(phoneno);
	}

	@Override
	public List<CustEnquiry> getAllCustHistory(String phoneno) {
		
		return custEnquiryRepository.findAllByPhoneno(phoneno);
	}

	
}
