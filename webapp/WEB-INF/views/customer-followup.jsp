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
<title>Customer Followup</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" type="text/css" href="CSS/style.css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

   <script type="text/javascript">
   
          function getSelectedDate(){
        	  var selectedDate=$('#datePickerId').val();
        	  
        	  $.ajax({
        		  type:"GET",
        		  url:"/customerFollowupPage",
        		  data:{selectedDate:selectedDate},
        		  success:function(data){
        			  //alert(data);
        			  var tablebody=$(data).find("tbody");
        			  $('#followupTable tbody').html(tablebody.html());
        		  },
        		  error:function(xhr,status,error){
        			  alert(error);
        		  }
        	  });
        	 
          }
          
          function custFollowupHistory(phoneNumber){
        	  if(phoneNumber!==""){
        		  window.location.href="custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
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
					style="text-align: center; padding: 30px">
					<h3>Customer Follow Ups</h3>
					<p>Below are the details of the customers to be called</p>
					<p>Or you can choose any date:<input type="date" class="form-control" id="datePickerId" onchange="getSelectedDate()"/></p>
					<br />
					<table id="followupTable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        
                        <th>Customer Phone no.</th>
                        <th style="text-align:center;">Get History</th>
                        
                    </tr>
                </thead>
                <tbody>
                      <c:forEach var="followup" items="${model_followups}" varStatus="loop">
                        <tr>
                           
                           <td>${loop.index+1}</td>
                           <td>${followup.getPhoneno()}</td>
                           <td style="text-align: center;"> 
                           
                                <button class="btn btn-success" onclick="custFollowupHistory('${followup.getPhoneno()}')"> 
                    			        Get History
                    			 </button>
                    			
                    		</td>
                    		
                        </tr>
                    
                    </c:forEach>
                    
                </tbody>
            </table>
            
				</div>

			</div>
		</div>
	</div>

</body>
</html>
