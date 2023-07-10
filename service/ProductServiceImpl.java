package in.sp.mains.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.mains.entity.Product;
import in.sp.mains.entity.SaleCourse;
import in.sp.mains.repository.ProductRepository;
import in.sp.mains.repository.SaleCourseRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	SaleCourseRepository saleCourseRepository;
	
	@Override
	public boolean addProductService(Product product) {
		boolean status=false;
		try {
			
			productRepository.save(product);
			status=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Product> getAllProductsListService() {
		return productRepository.findAll();
	}

	@Override
	public Product getProductDetailsService(String coursename) {
		 
		return productRepository.findByCoursename(coursename);
	}

	@Override
	public List<String> getAllCourseNameService() {
		
		return productRepository.findCourseName();
	}

	@Override
	public Product getSelectedCourseDetails(String coursename) {
		
		
		return productRepository.findByCoursename(coursename);
	}

	@Override
	public boolean addSaleCourseDetails(SaleCourse salecourse) {
		boolean status=false;
		
		try {
			saleCourseRepository.save(salecourse);
			status=true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Object[]> getPurchasedCourseCountService() {
		
		return saleCourseRepository.countBydate();
	}

}
