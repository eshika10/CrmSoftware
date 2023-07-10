<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Crm Application</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


        <link rel="stylesheet" type="text/css" href="CSS/style.css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <jsp:include page="headerCrm.jsp"/>
         
        <div class="container-fluid  main_page_banner">
            <div class="row">
                <div class="col-8">
                    <span class="main_page_title">Customer Relationship Management (CRM) tool helps you capture leads, automate your messaging, and stay top of mind with your audiences.

                        Start Building Relationships</span>
                </div>
                <div class="col-4" >
                    <img src="images/Crm image.png" height="200"/>
                </div>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="container" style="padding-top:20px">
                <div class="row">
                    <div class="col-6" style="margin-top:20px">
                        <h3>Key Points</h3>
                        <ul>
                            <li>Automation that offloads repetitive work</li>
                            <li>AI that increases efficiency and customer experiences</li>
                            <li>A combination of workflow automation, real-time decisioning, and low-code usability</li>
                            <li>Support for complex processes, ideal for large enterprises</li>
                            <li>Real-time customer context to "proactively-even preemptively-engage" with customers</li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-4" style="margin-top:20px">
                                <h5>E-Commerce</h5>
                                <img src="images/e commerce.png" height="100"/>
                                <ul>
                                    <li>E-Commerce Facility</li>
                                    <li>Online Payment</li>
                                    <li>Easy Browsing</li>
                                </ul>
                            </div>
                            <div class="col-4" style="float:left;margin-top:20px">
                                <h5>Human Resources</h5>
                                <img src="images/hr.png" height="100"/>
                                <ul>
                                    <li>Add Functionality</li>
                                    <li>Delete Functionality</li>
                                    <li>Update Functionality</li>
                                </ul>
                            </div>
                            <div class="col-4" style="margin-top:20px">
                                <h5>Admin Management</h5>
                                <img src="images/admin.png" height="100"/>
                                <ul>
                                    <li>Easy Admin Management</li>
                                    <li>Manage Employees</li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
    