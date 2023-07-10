<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

	<div class="container-fluid bg-primary header_design">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<a href="profile-admin" class="navbar-brand text-light">CRM
						Application </a>
				</div>
				<div class="col-5"></div>
				<div class="col-4">
					<a class="navbar-brand text-light" href="#"> <img
						src="images/admin.png" alt="Welcome Admin" style="width: 40px"
						class="round-pill" /> Welcome:Admin
					</a> <a class="navbar-brand text-light" href="logout">Logout</a>
				</div>
			</div>

		</div>
	</div>

	<div>
		<nav
			class="navbar navbar-expand-sm bg-dark navbar-dark container-fluid">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-center"
					id="collapsibleNavbar">
					<ul class="navbar-nav" style="text-align: center">
					    <li class="nav-item"><a class="nav-link" href="profile-admin">Home</a>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">Employees</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="addEmpdetails">Add Employees</a></li>
								<li><a class="dropdown-item" href="emplist">Employee's List</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">Products</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="addProducts">Add Products</a></li>
								<li><a class="dropdown-item" href="productsList">Product's List</a></li>
							</ul></li>

						
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>