<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.faca.service.impl.*,com.faca.service.*,com.faca.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
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
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="navBar.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<section>
		<form action="./UpdateProductSrv" method="post"
				class="col-md-6"
				style="border: 2px solid black; border-radius: 10px; background-color: transparent; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="./ShowImage?pid=<%=product.getProdId()%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Product Update Form</h2>
					</div>

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
				<div class="row">
					<input type="hidden" name="pid" class="form-control"
						value="<%=product.getProdId()%>" id="last_name" required>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Product Name</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							value="<%=product.getProdName()%>" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<%
						String ptype = product.getProdType();
						%>
						<label for="producttype">Product Type</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="t-shirts"
								<%="t-shirts".equalsIgnoreCase(ptype) ? "selected" : ""%>>T-shirts</option>
							<option value="trousers"
								<%="trousers".equalsIgnoreCase(ptype) ? "selected" : ""%>>Trousers</option>
							<option value="shirts"
								<%="shirts".equalsIgnoreCase(ptype) ? "selected" : ""%>>Shirts</option>
							<option value="gowns"
								<%="gowns".equalsIgnoreCase(ptype) ? "selected" : ""%>>Gowns</option>
							<option value="sports"
								<%="sports".equalsIgnoreCase(ptype) ? "selected" : ""%>>Sports</option>
							<option value="skirts"
								<%="skirts".equalsIgnoreCase(ptype) ? "selected" : ""%>>Skirts</option>
							<option value="shoes"
								<%="shoes".equalsIgnoreCase(ptype) ? "selected" : ""%>>Shoes</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Product Description</label>
					<textarea name="info" class="form-control text-align-left"
						id="last_name" required><%=product.getProdInfo()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Unit Price</label> <input type="number"
							value="<%=product.getProdPrice()%>"
							placeholder="Enter Unit Price" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Stock Quantity</label> <input type="number"
							value="<%=product.getProdQuantity()%>"
							placeholder="Enter Stock Quantity" class="form-control"
							id="last_name" name="quantity" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6" style="margin-bottom: 2px;">
						<button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Update
							Product</button>
					</div>
				</div>
			</form>
	</section>

	<%@ include file="footer.html"%>
</body>
</html>