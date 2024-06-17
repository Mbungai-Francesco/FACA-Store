<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.faca.service.impl.*,com.faca.service.*,com.faca.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Payment</title>
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
<body id="mainBody">

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	String sAmount = request.getParameter("amount");

	double amount = 0;

	if (sAmount != null) {
		amount = Double.parseDouble(sAmount);
	}
	%>



	<jsp:include page="navBar.jsp" />

	<section>
		<form action="./OrderServlet" method="post"
				class="col-md-6"
				style="border: 2px solid black; border-radius: 10px; background-color: transparent; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<h2 style="color: green;">Credit Card Payment</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Name of Card Holder</label> <input
							type="text" placeholder="Enter Card Holder Name"
							name="cardholder" class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Enter Credit Card Number</label> <input
							type="number" placeholder="0000-0000-0000-0000" name="cardnumber"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Month</label> <input type="number"
							placeholder="MM" name="expmonth" class="form-control" size="2"
							max="12" min="00" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Year</label> <input type="number"
							placeholder="YYYY" class="form-control" size="4" id="last_name"
							name="expyear" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6 form-group">
						<label for="last_name">Enter CVV</label> <input type="number"
							placeholder="123" class="form-control" size="3" id="last_name"
							name="expyear" required> <input type="hidden"
							name="amount" value="<%=amount%>">

					</div>
					<div class="col-md-6 form-group">
						<label>&nbsp;</label>
						<button type="submit" class="form-control btn btn-success">
							Pay :XAF
							<%=amount%></button>
					</div>
				</div>
			</form>
	</section>

	<!-- ENd of Product Items List -->


	<%@ include file="footer.html"%>

</body>
</html>