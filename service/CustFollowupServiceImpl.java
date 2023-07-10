package in.sp.mains.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.mains.entity.CustFollowup;
import in.sp.mains.repository.CustFollowupRepository;

@Service
public class CustFollowupServiceImpl implements CustFollowupService {

	@Autowired
	CustFollowupRepository custFollowupRepository;

	@Override
	public boolean addCustFollowupDateService(CustFollowup custFollowup) {
		boolean status=false;
		try {
			
			CustFollowup custFollowup_db=custFollowupRepository.findByPhoneno(custFollowup.getPhoneno());
			if(custFollowup_db!=null) {
				
				custFollowup_db.setFollowupdate(custFollowup.getFollowupdate());
				custFollowupRepository.save(custFollowup_db);
			}else {
				custFollowupRepository.save(custFollowup);
			}
			
		    status=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<CustFollowup> getFollowupForProvidedDate(String followupDate) {
		
		return custFollowupRepository.findByFollowupdate(followupDate);
	}
	
	

}
