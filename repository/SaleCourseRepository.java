package in.sp.mains.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.mains.entity.SaleCourse;

public interface SaleCourseRepository extends JpaRepository<SaleCourse,Integer>{

	@Query("Select date,count(id) from SaleCourse GROUP BY date")
	List<Object[]> countBydate();
}
