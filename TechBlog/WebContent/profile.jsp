<%@page import="com.murari.blog.bo.CategoryBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.murari.blog.helper.ConnectionProvider"%>
<%@page import="com.murari.blog.dao.PostDAO"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.murari.blog.bo.UserInfoBO"%>
<%@page import="com.murari.blog.bo.MessageBO"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 100%, 70% 89%, 32% 100%, 0 91%, 0 0);
}
</style>
</head>
<body>
	<%
		UserInfoBO bo = (UserInfoBO) session.getAttribute("currentUser");
	if (bo == null)
		response.sendRedirect("login_page.jsp");
	%>

	<!-- 	navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-laptop"></span> TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"><span
						class="fa fa-home"></span>LearnCode with Murari <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Developement</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure And Algorithm</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal">Post Here</a></li>

			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><%=bo.getName()%></a>
				</li>
				<li class="nav-item"><a class="nav-link " href="LogoutServlet">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

	<!-- End of NavBar -->

	<%
		MessageBO messageBO = (MessageBO) session.getAttribute("msg");
	if (messageBO != null) {
	%>
	<div class="alert <%=messageBO.getCssClass()%> role="alert">
		<%=messageBO.getContent()%>
	</div>
	<%
		session.removeAttribute("msg");
	}
	%>

	<!-- 	main body of page -->

	<main>
		<div class="container">
			<div class="row mt-4">
				<!-- 				first col -->
				<div class="col-md-4">
					<!-- 				List of Categories -->

					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
							All Posts </a>
						<!-- 					  categories -->
						<%
							PostDAO pDAO = new PostDAO(ConnectionProvider.getConnection());
						ArrayList<CategoryBO> cBOList = pDAO.getAllCategory();
						for (CategoryBO catBO : cBOList) {
						%>

						<a href="#" onclick="getPosts(<%=catBO.getCatId()%>,this)" class="c-link list-group-item list-group-item-action"><%=catBO.getCatName()%></a>
						<%
							}
						%>


					</div>

				</div>
				<!-- 				second col -->
				<div class="col-md-8">
					<!-- 				Show posts here -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>

					<div class="container-fluid" id="post-container"></div>
				</div>
			</div>
			
		</div>


	</main>

	<!-- 	End of main body -->


	<!-- 	profile modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="staticBackdropLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=bo.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 200px">
						<h5 class="modal-title " id="staticBackdropLabel"><%=bo.getName()%></h5>

						<!--         details -->
						<div id="profile-detail">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Id</th>
										<td><%=bo.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=bo.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=bo.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Since</th>
										<td><%=bo.getDateTime()%></td>

									</tr>
									<tr>
										<th scope="row">About</th>
										<td><%=bo.getAbout()%></td>

									</tr>

								</tbody>
							</table>
						</div>

						<!-- 						profile Edits -->
						<div id="profile-edit" style="display: none">
							<h3 class="mt-2">Please Edit carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID</td>
										<td><%=bo.getId()%></td>
									</tr>
									<tr>
										<td>Name</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=bo.getName()%>"></td>
									</tr>
									<tr>
										<td>Email</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=bo.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=bo.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender</td>
										<td><%=bo.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About</td>
										<td><textarea rows="5" class="form-control"
												name="user_about">
												<%=bo.getAbout()%>
											</textarea></td>
									</tr>
									<tr>
										<td>Add new pic</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>

								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of profile modal -->

	<!-- 	add post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cat_id">
								<option selected disabled>---Select Category---</option>

								<%
									PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
								ArrayList<CategoryBO> catBOList = postDAO.getAllCategory();
								for (CategoryBO catBO : catBOList) {
								%>
								<option value="<%=catBO.getCatId()%>"><%=catBO.getCatName()%></option>
								<%
									}
								%>


							</select>
						</div>

						<div class="form-group">
							<input name="post_title" type="text"
								placeholder="Enter post title" class="form-control">
						</div>
						<div class="form-group">
							<textarea name="post_content" type="text"
								placeholder="Enter your Content" style="height: 200px"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<textarea name="post_code" type="text"
								placeholder="Enter your Code" style="height: 100px"
								class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Enter pic </label><br> <input type="file"
								name="post_pic">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">POST</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- End of post modal -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			let editStatus = false
			$('#edit-profile-btn').click(function() {

				if (editStatus == false) {
					$("#profile-detail").hide()
					$("#profile-edit").show()
					editStatus = true
					$(this).text("BACK")
				} else {
					$("#profile-detail").show()
					$("#profile-edit").hide()
					editStatus = false
					$(this).text("EDIT")
				}
			});
		});
	</script>
	<!-- 	now add post js -->
	<script>
		$(document).ready(function(e){
			$("#add-post-form").on("submit",function(event){
				//this code gets called when form is submitted
				event.preventDefault();
				console.log("Post submitted");
				let form=new FormData(this);
				
				//now requesting to server
				$.ajax({
					url:"AddPostServlet",
					type:'POST',
					data:form,
					success:function(data,textStatus,jqXHR){
						//success
						console.log(data);
						if(data.trim()=='done'){
							swal("Good job!", "You clicked the button!", "success");
						}
						else{
							swal("Error!", "Something went wrong!, "error");
						}
					},
					error:function(data,textStatus,errorThrown){
						swal("Error!", "Something went wrong!, "error");
					},
					processData:false,
					contentType:false
				})
			})
		})
	</script>
	<script>
	
		function getPosts(catId,temp){
			
			$("#loader").show()
			$("#post-container").hide()
			
			$(".c-link").removeClass('active')
			
			$.ajax({
				url:"load_post.jsp",
				data:{cid:catId},
				success:function(data,textStatus,jqXHR){
					console.log(data);
					$("#loader").hide();
					$("#post-container").show()
					$('#post-container').html(data);
					$(temp).addClass('active')
				}
			});
		}
		$(document).ready(function(e){
			let allPostRef=$('.c-link')[0]
			getPosts(0,allPostRef)
		});
	</script>

</body>
</html>