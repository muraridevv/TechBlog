package com.murari.blog.servlets;

import static java.lang.System.out;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.murari.blog.bo.UserInfoBO;
import com.murari.blog.dao.UserDAO;
import com.murari.blog.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
    
   

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao=null;
		UserInfoBO bo=null;
		HttpSession ses=null;
		PrintWriter pw=null;
		
		//get printWriter
		pw=resp.getWriter();
		//fetch all form data
		String check=req.getParameter("check");
		if(check==null)
			out.println("box not checked");
		else {
			String name=req.getParameter("user_name");
			String email=req.getParameter("user_email");
			String password=req.getParameter("user_password");
			String gender=req.getParameter("gender");
			String about=req.getParameter("about");
			
			//create session object and begin the session
			ses=req.getSession(true);
			
			//create user object and set data to bo object
			bo=new UserInfoBO();
			bo.setName(name);
			bo.setEmail(email);
			bo.setPassword(password);
			bo.setGender(gender);
			bo.setAbout(about);
			
			//create user dao object
			dao=new UserDAO(ConnectionProvider.getConnection());
			if(dao.saveUser(bo))
				pw.println("done");
			else {
				pw.println("error");
			}
		}
		
	}


	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
}
