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
<title>Customer Enquiry</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
	
<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
    $(document).ready(function(){
    	$("#phonenoInput").keyup(function(){
    		var phoneNumber=$(this).val();
    		$.ajax({
    			url:"/checkPhoneNumberAvailability",
    			data:{phoneNumber:phoneNumber},
    			success:function(response){
    				if(response==="exists"){
    					
    					$('#phonenoInput').addClass("is-valid");
    					
    					$("#nameInput").prop("readonly",true);
    					$("#interestedCourseInput").prop("disabled",true);
    					$("#discussionInput").prop("readonly",true);
    					$("#enquiryTypeInput").prop("disabled",true);
    					$("#statusInput").prop("disabled",true);
    					$("#followupInput").prop("readonly",true);
    					$("#calltoInput").prop("disabled",true);
    					$("#addenq").prop("disabled",true);
    					
    					$("#getHistoryBtn").show();
    					
    				}else{
    					$('#phonenoInput').removeClass("is-valid");
    					
    					$("#nameInput").prop("readonly",false);
    					$("#interestedCourseInput").prop("disabled",false);
    					$("#discussionInput").prop("readonly",false);
    					$("#enquiryTypeInput").prop("disabled",false);
    					$("#statusInput").prop("disabled",false);
    					$("#followupInput").prop("readonly",false);
    					$("#calltoInput").prop("disabled",false);
    					$("#addenq").prop("disabled",false);
    					
    					$("#getHistoryBtn").hide();
    				}
    			}
    		});
    	});
    });
    
    function custEnquiryHistory(){
    	var phoneNumber=$('#phonenoInput').val();
    	if(phoneNumber !== ""){
    		window.location.href='/custEnquiryHistoryPage?phno='+encodeURIComponent(phoneNumber);
    	}
    }
    
    function handleOption(){
    	 var statusOption=document.getElementById("statusInput").value;
    	 if(statusOption==='1'){
    		 $("#followupInput").prop("readonly",false);
    	 }else{
    		 $("#followupInput").prop("readonly",true);
    	 }
    }
    
</script>


</head>
<body>

	<jsp:include page="headerEmp.jsp" />
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
					    <img src="images/customer enquiry1.png" height="250"
						   style="margin-top: 150px; float: left">
			   </div>
				<div class="col-5 text-dark bg-light"
					style="text-align: center; padding:30px;">
					<h3>Customer Enquiry</h3>
					<br />
					<form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr" >
					  
						<div>
							<label class="form-label">Phone No.</label> 
							<form:input path="phoneno" cssClass="form-control"  id="phonenoInput" /><br>
							  <button  type="button" id="getHistoryBtn" class="btn btn-success" style="display:none;" onclick="custEnquiryHistory()">Get History</button>
							<form:errors path="phoneno" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Name</label> 
							<form:input  path="custEnquiry.name" cssClass="form-control" id="nameInput"/>
							<form:errors path="custEnquiry.name" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Interested Course</label>
							 <form:select  path="custEnquiry.interestedcourse" cssClass="form-select" id="interestedCourseInput">
							      <form:option value="">Select Course</form:option>
							      <form:options items="${model_coursename_list}"/>
							 </form:select>
							 <form:errors path="custEnquiry.interestedcourse" cssClass="error_message_design" />
						</div>
						<br />

						<div>
							<label class="form-label">Discussion</label> 
							<form:textarea  path="custEnquiry.discussion" cssClass="form-control" id="discussionInput"/>
							<form:errors path="custEnquiry.discussion" cssClass="error_message_design" />
							
						</div>
						<br />
						
						<div >
							<label class="form-label">Enquiry Type</label> 
							<form:select  path="custEnquiry.enquirytype" cssClass="form-select" id="enquiryTypeInput">
							      <form:option value="">Select Enquiry Type</form:option>
							      <form:option value="Call">Call</form:option>
							      <form:option value="Website">Website</form:option>
							      <form:option value="Mail">Mail</form:option>
							      <form:option value="Social Networking">Social Networking</form:option>
							 </form:select>
							<form:errors path="custEnquiry.enquirytype" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Status</label> 
							<form:select  path="custEnquiry.status" cssClass="form-select" id="statusInput" onchange="handleOption()">
							      <form:option value="">Select Status</form:option>
							      <form:option value="1">Open (1)</form:option>
							      <form:option value="2">Interested-Closed (2)</form:option>
							      <form:option value="3">Not-Interested-Closed (3)</form:option>
							      <form:option value="4">Purchased-Closed (4)</form:option>
							 </form:select>
							<form:errors path="custEnquiry.status" cssClass="error_message_design" />
						</div>
						<br />
						<div>
							<label class="form-label">Followup Date</label>
							 <form:input type="date"  path="custFollowup.followupdate" cssClass="form-control" id="followupInput"/>
							 <form:errors path="custFollowup.followupdate" cssClass="error_message_design" />
						</div>
						<br />

						<div>
							<label class="form-label">Call To</label> 
							<form:select  path="custEnquiry.callto" cssClass="form-select" id="calltoInput">
							      <form:option value="">Call To</form:option>
							      <form:option value="Customer To Company">Customer To Company</form:option>
							      <form:option value="Company tO Custome">Company tO Customer</form:option>
							 </form:select>
							<form:errors path="custEnquiry.callto" cssClass="error_message_design" />
							
						</div>
					   <br />
						<input type="submit" value="Add Enquiry" class="btn btn-danger" id="addenq" />
					 
					</form:form>
					
			     
				</div>
               
			</div>
		</div>
	</div>

</body>
</html>
