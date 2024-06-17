<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css">
	<style>
		.navbar-nav li:nth-child(2) a {
		color: black !important;
		font-weight: 700;
		}
		section{
		    display: flex !important;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		    width: 100%;
		    background: url('./images/2021-03-15_eCommerceCOVID19report-1-1220x675px.jpg');
		    background-position: center;
		    background-size: cover;
		}
		form{
			justify-content: center;
   	 		align-items: center;
		    backdrop-filter: blur(15px);
		}
	</style>
</head>
<body id="mainBody" >

	<%@ include file="navBar.jsp"%>
	<%
	String message = request.getParameter("message");
	%>
	<section>
			<form action="./RegisterSrv" method="post"
				class="col-md-6"
				style="border: 2px solid black; border-radius: 10px; background-color: transparent; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Registration Form</h2>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div></div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="first_name">Name</label> <input type="text"
							name="username" class="form-control"  required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Email</label> <input type="email"
							name="email" class="form-control"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Address</label>
					<textarea name="address" class="form-control"
						name="address" required></textarea>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Mobile</label> <input type="number"
							name="mobile" class="form-control"  required>
					</div>

				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Password</label> <input type="password"
							name="password" class="form-control"  required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Confirm Password</label> <input
							type="password" name="confirmPassword" class="form-control"
							 required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button type="Reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Register</button>
					</div>
				</div>
			</form>
		</section>
</body>
</html>