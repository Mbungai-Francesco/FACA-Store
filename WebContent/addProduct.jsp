<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css">
<style>
	body{
		display:flex;
		flex-direction: column;
		justify-content: space-between;
		min-height: 100vh;
		    width: 100%;
		    background: url('./images/cyber-monday-shopping-sales.jpg');
		    background-position: center;
		    background-size: cover;
	}
	#myNavbar li:nth-child(6) a {
		color: black !important;
		font-weight: 700  !important;
		font-style: 'Poppins' !important;
	}
	section{
		    display: flex !important;
		    justify-content: center;
		    align-items: center;
		    margin-block: 5em !important;
		}
		form{
			justify-content: center;
   	 		align-items: center;
		    backdrop-filter: blur(15px);
		}
		footer{
			margin: 0 !important;
		}
	</style>
</head>
<body id="mainBody" >
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="navBar.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<section>
		<form action="./AddProductSrv" method="post"
				enctype="multipart/form-data" class="col-md-6"
				style="border: 2px solid black; border-radius: 10px; background-color: transparent; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Product Addition Form</h2>
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
						<label for="last_name">Product Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="producttype">Product Type</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="shirts">T-shirts</option>
							<option value="trousers">Trousers</option>
							<option value="gowns">Gowns</option>
							<option value="sports">Sports</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Product Description</label>
					<textarea name="info" class="form-control" id="last_name" required></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							placeholder="Enter Stock Quantity" name="quantity"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div>
					<div class="col-md-12 form-group">
						<label for="last_name">Product Image</label> <input type="file"
							placeholder="Select Image" name="image" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;">
						<button type="reset" class="btn btn-danger">Reset</button>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-success">Add Product</button>
					</div>
				</div>
			</form>
	</section>

	<%@ include file="footer.html"%>
</body>
</html>