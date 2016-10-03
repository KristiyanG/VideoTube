package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println(email + "  " + password);
		User user = UserDAO.getInstance().getUserByUsername(email);
		
		System.out.println(user != null);
		
		HttpSession ses = request.getSession();
		ses.setAttribute("user", user);
		
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/myChannel.jsp");
		
		if (dispatcher != null){  
		      dispatcher.forward(request, response);
		}
	}

}
