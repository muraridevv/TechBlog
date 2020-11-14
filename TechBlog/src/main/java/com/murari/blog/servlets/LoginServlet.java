package com.murari.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.murari.blog.bo.MessageBO;
import com.murari.blog.bo.UserInfoBO;
import com.murari.blog.dao.UserDAO;
import com.murari.blog.helper.ConnectionProvider;


public class LoginServlet extends HttpServlet {
  
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw=null;
		HttpSession ses=null;
		String userName=null,password=null;
		UserDAO dao=null;
		UserInfoBO bo=null;
		MessageBO messageBO=null;
		
		//get printWriter
		pw=resp.getWriter();
		
		
		
		//Login fetch username and password
		userName=req.getParameter("email");
		password=req.getParameter("password");
		
		dao=new UserDAO(ConnectionProvider.getConnection());
		bo=dao.getUserByEmailAndPassword(userName, password);
		
		if(bo==null) {
			//login error
			//pw.println("Invalid Email/password");
			messageBO=new MessageBO();
			messageBO.setContent("Invalid Email/Password! Retry");
			messageBO.setType("error");
			messageBO.setCssClass("alert-danger");
			
			ses=req.getSession();
			ses.setAttribute("msg", messageBO);
			resp.sendRedirect("login_page.jsp");
		}
		else {
			//create session object and begin the session
			ses=req.getSession(true);
			ses.setAttribute("currentUser", bo);
			resp.sendRedirect("profile.jsp");
		}
			
	}

	public  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
