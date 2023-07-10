package in.sp.mains.service;

import java.util.List;

import in.sp.mains.entity.CustFollowup;

public interface CustFollowupService {

	public boolean addCustFollowupDateService(CustFollowup custFollowup);
	
	public List<CustFollowup> getFollowupForProvidedDate(String followupDate);
}
