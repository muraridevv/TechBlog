<%@page import="java.io.PrintWriter"%>
<%@page import="com.murari.blog.bo.PostBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.murari.blog.helper.ConnectionProvider"%>
<%@page import="com.murari.blog.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="row">
<%
	PostDAO postDAO = null;
	ArrayList<PostBO> postBOList=null;
	postDAO = new PostDAO(ConnectionProvider.getConnection());
	PrintWriter pw=response.getWriter();
	
	int cid=Integer.parseInt(request.getParameter("cid"));
	if(cid==0){
		postBOList= postDAO.getAllPosts();
	}
	else{
		postBOList=postDAO.getPostsByCategory(cid);
	}
	
	if(postBOList.size()==0){
		pw.println("<h3 class='display-3 text-center'>No posts in this category</h3>");
		return;
	}
	
	for(PostBO postBO:postBOList){
	
		%>
<div class="col-md-6 mt-2">
	<div class="card">
		<img src="pics/<%=postBO.getPostPic() %>" class="card-img-top" alt="Card image cap">
		<div class="card-body">
			<b><%=postBO.getPostTitle() %></b>
			<p><%=postBO.getPostContent() %>
			
		</div>
		<div class="card-footer text-center">
			<a href="show_blog_page.jsp?post_id=<%=postBO.getPostId() %>" class="btn btn-outline-primary btn-sm">Read More</a>
			<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span>10</span></i></a>
			<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>5</span></i></a>
		</div>
	</div>

</div>
		
		
		
		
		
<%
	}
	
%>

</div>