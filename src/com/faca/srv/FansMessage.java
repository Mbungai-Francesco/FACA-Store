package com.faca.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faca.utility.MailMessage;

/**
 * Servlet implementation class fansMessage
 */
@WebServlet("/fansMessage")
public class FansMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String comments = request.getParameter("comments");

		response.setContentType("text/html");
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:green;'>Message to FACA Store</h2>" + ""
				+ "Customer's Message Received !!<br/><br/> Name: " + name + "," + "<br/><br/> Email: " + email
				+ "<br><br/>" + "Comment: " + "<span style='color:grey;'>" + comments + "</span>"
				+ "<br/><br/>We are glad that one of our favotite Customer has chosen us! <br/><br/>Thanks & Regards"
				+ "</body>" + "</html>";
		String message = MailMessage.sendMessage("mbungaifrancesco2@gmail.com", "Customer Message | " + name + " | " + email,
				htmlTextMessage);
		if ("SUCCESS".equals(message)) {
			message = "Comments Sent Successfully";
		} else {
			message = "Failed: Please Configure mailer.email and password in application.properties first";
		}
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

		rd.include(request, response);

		response.getWriter().print("<script>alert('" + message + "')</script>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
