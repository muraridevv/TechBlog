<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	
		 <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	    <link href="css/mystyle.css" rel="stylesheet" type="text/css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <style>
	      .banner-background{
	        clip-path: polygon(50% 0%, 100% 0, 100% 100%, 70% 89%, 32% 100%, 0 91%, 0 0);
	
	      }
	    </style>
	</head>
	<body>
		<div class="container text-center">
			<img src="images/error.png" height="200px" width="240px" class="img-fluid">
			<h3 class="display-3">Sorry! Something went wrong...</h3>
			<%=exception %>
			<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
		</div>
	</body>
</html>