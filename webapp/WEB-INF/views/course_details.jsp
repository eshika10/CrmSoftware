<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
<head>
<title>Product Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

     <jsp:include page="headerAdmin.jsp"/>
	<div class="container mt-3">
		<h6>Course Details</h6>
		<div class="row">
		      <div class="col-4">
		          <img src="${model_product_details.getCourseimage()}" height="120"/>
		      </div>
		      <div  class="col-8">
		          <p><strong>Course Name: ${model_product_details.getCoursename()}</strong></p>
		          <p><strong>Course Price: <del style="color:red">Rs.${model_product_details.getOriginalprice()}</del> &nbsp;&nbsp; Rs.${model_product_details.getDiscountedprice()}</strong></p>
		          <p><strong>Course Validity: ${model_product_details.getCoursevalidity()}</strong></p>
		          <p><strong>Course Syllabus: ${model_product_details.getSyllabus()}</strong></p>
		      </div>
		</div>
		<div class="row">
		      <h6>Trainer's Details</h6>
		      <div class="col-4">
		          <img src="${model_product_details.getTrainersimage()}" height="120"/>
		      </div>
		      <div  class="col-8">
		          <p><strong>Trainer Name:  ${model_product_details.getTrainersname()}</strong></p>
		          <p><strong>Trainer Details: ${model_product_details.getTrainersdetails()}</strong></p>
		          
		      </div>
		</div>
		<div class="row">
		    <h6>Important Instructions</h6>
		    <div class="col-8">
		        <p class="text-danger"><strong>${model_product_details.getOtherdetails()}</strong></p>
		    </div>
		</div>

	</div>



</body>
</html>
