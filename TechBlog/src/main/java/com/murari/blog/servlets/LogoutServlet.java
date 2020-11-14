package com.murari.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.murari.blog.bo.MessageBO;


public class LogoutServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ses=null;
		MessageBO mBo=null;
		ses=req.getSession();
		ses.removeAttribute("currentUser");
		mBo=new MessageBO();
		mBo.setContent("Logout Successfully");
		mBo.setType("success");
		mBo.setCssClass("alert-success");
		ses.setAttribute("msg", mBo);
		resp.sendRedirect("login_page.jsp");
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
