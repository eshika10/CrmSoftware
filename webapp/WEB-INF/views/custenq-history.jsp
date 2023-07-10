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
<title>Customer Enquiry History</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
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

	<jsp:include page="headerCrm.jsp" />
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
				
				<div class="col-6 text-dark bg-light"
					style="text-align: center; padding: 30px">
					<h3>Customer History</h3>
					
					
					<p>Below is the history of customer ${model_enq_his.get(0).getName()} (${model_enq_his.get(0).getPhoneno()})</p>
					<br />
					<table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Discussion</th>
                        <th>Interested Course</th>
                        <th>EnquiryDate/EnquiryTime</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="custenq" items="${model_enq_his}">
                        <tr>
                           <td>${custenq.getDiscussion()}</td>
                           <td>${custenq.getInterestedcourse()}</td>
                           <td>${custenq.getEnquirydate()} (${custenq.getEnquirytime()})</td>
                           	 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
		</div>
	
	

	<div class=" col-6 text-dark bg-light" style="text-align: center; padding: 30px; float:right">
          <h3>Customer Enquiry Form</h3>  
          <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr" >
				       <form:hidden path="phoneno" value="${model_enq_his.get(0).getPhoneno()}"/> 
				      <form:hidden path="custEnquiry.name" value="${model_enq_his.get(0).getName()}"/>
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
