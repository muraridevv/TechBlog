package com.murari.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.murari.blog.dao.LikesDAO;
import com.murari.blog.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String operation=null;
		int uid,pid;
		PrintWriter pw=resp.getWriter();
		
		operation=req.getParameter("operation");
		uid=Integer.parseInt(req.getParameter("uid"));
		pid=Integer.parseInt(req.getParameter("pid"));
		
	//	pw.println(pid+"  "+uid);
		LikesDAO likesDAO=new LikesDAO(ConnectionProvider.getConnection());
		if(operation.equals("like")) {
			boolean flag=likesDAO.insertLikes(uid, pid);
			pw.println(flag);
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
