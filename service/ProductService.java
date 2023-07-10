package in.sp.mains.service;

import java.util.List;

import in.sp.mains.entity.Product;
import in.sp.mains.entity.SaleCourse;

public interface ProductService {

	public boolean addProductService(Product product);
	public List<Product> getAllProductsListService();
	public Product getProductDetailsService(String coursename);
	public List<String> getAllCourseNameService();
	
	public Product getSelectedCourseDetails(String coursename);
	public boolean addSaleCourseDetails(SaleCourse salecourse);
	
	public List<Object[]> getPurchasedCourseCountService();
}
