package com.murari.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.murari.blog.bo.MessageBO;
import com.murari.blog.bo.UserInfoBO;
import com.murari.blog.dao.UserDAO;
import com.murari.blog.helper.ConnectionProvider;
import com.murari.blog.helper.ImageHelper;

import lombok.experimental.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail=null,userName=null,userPassword=null,userAbout=null,imageName=null,oldFile=null;
		Part part=null;
		HttpSession ses=null;
		UserInfoBO bo=null;
		UserDAO dao=null;
		boolean ans=false;
		PrintWriter pw=null;
		MessageBO messageBO=null;
		pw=resp.getWriter();
		//fetch all data
		userEmail=req.getParameter("user_email");
		userName=req.getParameter("user_name");
		userPassword=req.getParameter("user_password");
		userAbout=req.getParameter("user_about");
		part=req.getPart("image");
		imageName=part.getSubmittedFileName();
		
		//get the user from session
		ses=req.getSession();
		bo=new UserInfoBO();
		bo=(UserInfoBO) ses.getAttribute("currentUser"); 
		System.out.println(userName);
		
		bo.setName(userName);
		bo.setEmail(userEmail);
		bo.setPassword(userPassword);
		bo.setAbout(userAbout);
		oldFile=bo.getProfile();
		bo.setProfile(imageName);
		
		//update database
		dao=new UserDAO(ConnectionProvider.getConnection());
		ans=dao.updateUser(bo);
		if(ans) {
			
			String path=req.getRealPath("/")+"pics"+File.separator+bo.getProfile();
			//delete file
			String oldFilePath=req.getRealPath("/")+"pics"+File.separator+oldFile;
			if(oldFile.equals("default-profile-pic.jpg"))
				ImageHelper.deleteFile(oldFilePath);
			
			if(ImageHelper.saveFile(part.getInputStream(), path)) {
				
				messageBO=new MessageBO();
				messageBO.setContent("Profile Updated");
				messageBO.setType("success");
				messageBO.setCssClass("alert-success");
				
				
				ses.setAttribute("msg", messageBO);
			}
			else {
				messageBO=new MessageBO();
				messageBO.setContent("Something went wrong");
				messageBO.setType("error");
				messageBO.setCssClass("alert-danger");
				
				ses=req.getSession();
				ses.setAttribute("msg", messageBO);
			}
		}
		else {
			messageBO=new MessageBO();
			messageBO.setContent("Something went wrong");
			messageBO.setType("error");
			messageBO.setCssClass("alert-danger");
			
			ses=req.getSession();
			ses.setAttribute("msg", messageBO);
		}
		resp.sendRedirect("profile.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
