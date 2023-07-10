package in.sp.mains.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.mains.entity.Product;

public interface ProductRepository extends JpaRepository<Product,Integer>{

	Product findByCoursename(String coursename);
	
	@Query("Select coursename from Product")
	List<String> findCourseName();
}
