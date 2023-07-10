<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
<head>
<title>Add Products</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<jsp:include page="headerAdmin.jsp" />
	<div class="container-fluid">
		<div class="container" style="padding-top: 20px">

			<c:if test="${not empty model_success}">
				<div class="row">
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						${model_success}
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</div>
			</c:if>
			
			<c:if test="${not empty model_error}">
				<div class="row">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						${model_error}
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</div>
			</c:if>

			<div class="row">
				<div class="col-4">
					<img src="images/products-emp-1.png" height="300"
						style="margin-top: 150px; float: left">
				</div>
				<div class="col-5 text-dark bg-light"
					style="text-align: center; padding: 30px">
					<h3>Add Course Details</h3>
					<br />
					<form:form action="addCourseForm" method="post" enctype="multipart/form-data" modelAttribute="productAttr">
						<div>
							<label class="form-label">Course Name</label> 
							<form:input path="coursename" cssClass="form-control" />
							<form:errors path="coursename" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Course Syllabus</label> 
							<form:input  path="syllabus" cssClass="form-control" />
							<form:errors path="syllabus" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Course Original Price</label>
							 <form:input  path="originalprice" cssClass="form-control" />
							 <form:errors path="originalprice" cssClass="error_message_design" />
						</div>
						<br />

						<div>
							<label class="form-label">Course Discounted Price</label> 
							<form:input  path="discountedprice" cssClass="form-control" />
							<form:errors path="discountedprice" cssClass="error_message_design" />
						</div>
						<br /> 
						
						<div>
							<label class="form-label">Course Image</label> 
							<form:input type="file" path="courseimage" cssClass="form-control" />
							<form:errors path="courseimage" cssClass="error_message_design" />
						</div>
						<br /> 
						
						<div>
							<label class="form-label">Course Validity</label> 
							<form:input  path="coursevalidity" cssClass="form-control" />
							<form:errors path="coursevalidity" cssClass="error_message_design" />
						</div>
						<br /> 
						
						
						<div>
							<label class="form-label">Trainer's Name</label> 
							<form:input  path="trainersname" cssClass="form-control" />
							<form:errors path="trainersname" cssClass="error_message_design" />
						</div>
						<br /> 
						
						<div>
							<label class="form-label">Trainer's Details</label> 
							<form:textarea  path="trainersdetails" cssClass="form-control" />
							<form:errors path="trainersdetails" cssClass="error_message_design" />
						</div>
						<br /> 
						
						<div>
							<label class="form-label">Trainer's Image</label> 
							<form:input type="file" path="trainersimage" cssClass="form-control" />
							<form:errors path="trainersimage" cssClass="error_message_design" />
						</div>
						<br /> 
						
						<div>
							<label class="form-label">Other Details</label> 
							<form:textarea  path="otherdetails" cssClass="form-control" />
							<form:errors path="otherdetails" cssClass="error_message_design" />
						</div>
						<br /> 
						<input type="submit" value="Add Course" class="btn btn-danger" />
					</form:form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
