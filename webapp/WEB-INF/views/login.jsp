<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
   <head>
        <title>Login Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


        <link rel="stylesheet" type="text/css" href="CSS/style.css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    
         <jsp:include page="headerCrm.jsp"/>
         
       
        
        <div class="container-fluid">
            <div  class="container" style="padding-top:20px">
                <div class="row">
                    <div class="col-4">
                        <img src="images/work_people.png" height="300" style="margin-top:150px ;float:right">
                    </div>
                    <div class="col-5 text-dark bg-light" style="text-align:center;padding:30px">
                    
                         <c:if test="${not empty model_error}">
                                <h5 style="color:red;"> ${model_error} </h5>
                         </c:if>
                         
                        <form action="loginForm" method="post">
                             <h3>Login Here</h3><br/>
                        <div>
                            <label class="form-label">Enter Email</label>
                            <input type="text" name="email1" class="form-control"/>
                        </div><br/>
                        <div>
                            <label class="form-label">Enter Password</label>
                            <input type="password" name="pass1" class="form-control"/>
                            <div class="form-text">We will not share your login credentials with anyone</div>
                        </div><br/>
                        <input type="submit" value="Login" class="btn btn-danger"/>
                        </form>  
                    </div>
                   
                </div>    
            </div>
        </div>
    </body>    
</html>
    