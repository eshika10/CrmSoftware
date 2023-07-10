package in.sp.mains.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.mains.entity.CustEnquiry;

public interface CustEnquiryRepository extends JpaRepository<CustEnquiry,Integer>{
     
	boolean existsByPhoneno(String phoneno);
	
	List<CustEnquiry> findAllByPhoneno(String phoneno);
	
}
