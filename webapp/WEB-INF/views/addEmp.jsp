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
<title>Add Employee</title>

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
					<img src="images/corporate-learning.png" height="250"
						style="margin-top: 150px; float: left">
				</div>
				<div class="col-5 text-dark bg-light"
					style="text-align: center; padding: 30px">
					<h3>Register Here</h3>
					<br />
					<form:form action="addEmpForm" method="post" modelAttribute="modelEmpAtt">
						<div>
							<label class="form-label">Enter Full Name</label> 
							<form:input path="name" cssClass="form-control" />
							<form:errors path="name" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Enter Email</label> 
							<form:input  path="email" cssClass="form-control" />
							<form:errors path="email" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Enter Password</label>
							 <form:password  path="password" cssClass="form-control" />
							 <form:errors path="password" cssClass="error_message_design" />
						</div>
						<br />

						<div>
							<label class="form-label">Enter Phone No.</label> 
							<form:input  path="phoneno" cssClass="form-control" />
							<form:errors path="phoneno" cssClass="error_message_design" />
							<div class="form-text">Credentials will be secured</div>
						</div>
						<br /> 
						<input type="submit" value="Register" class="btn btn-danger" />
					</form:form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
