<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
<head>
<title>Employee Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

     <jsp:include page="headerEmp.jsp"/>
	<div class="container mt-3">
		<h2>Hello ${session_emp.getName()}</h2>
		<h3>Email: ${session_emp.getEmail()}</h3>
		<h3>Phone No: ${session_emp.getPhoneno()}</h3>
		
	</div>



</body>
</html>
    