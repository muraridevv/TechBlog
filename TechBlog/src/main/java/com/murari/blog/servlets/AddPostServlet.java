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

import com.murari.blog.bo.PostBO;
import com.murari.blog.bo.UserInfoBO;
import com.murari.blog.dao.PostDAO;
import com.murari.blog.helper.ConnectionProvider;
import com.murari.blog.helper.ImageHelper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int catId=0;
		String postTitle=null,postContent=null,postCode=null;
		PrintWriter pw=null;
		Part part=null;
		HttpSession ses=null;
		UserInfoBO bo=null;
		PostDAO postDAO=null;
		
		//get printWriter
		pw=resp.getWriter();
		catId=Integer.parseInt(req.getParameter("cat_id"));
		postTitle=req.getParameter("post_title");
		postContent=req.getParameter("post_content");
		postCode=req.getParameter("post_code");
		part=req.getPart("post_pic");
		ses=req.getSession();
		bo=new UserInfoBO();
		bo=(UserInfoBO) ses.getAttribute("currentUser");
		
		//set data to BO object
		PostBO postBO=new PostBO();
		postBO.setPostTitle(postTitle);
		postBO.setPostContent(postContent);
		postBO.setPostCode(postCode);
		postBO.setPostPic(part.getSubmittedFileName());
		postBO.setCatId(catId);
		postBO.setUserId(bo.getId());
		
		pw.println(bo.getId());
		
		//send post data to dao class
		postDAO=new PostDAO(ConnectionProvider.getConnection());
		if(postDAO.savePost(postBO)) {
			
			String path=req.getRealPath("/")+"pics"+File.separator+part.getSubmittedFileName();
			ImageHelper.saveFile(part.getInputStream(), path);
			pw.println("done");
		}
		else {
			pw.println("error");
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);  
	}

}
