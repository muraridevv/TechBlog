<%@page import="com.murari.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
  
<!--   	navbar -->
	<%@include file="normal_navbar.jsp" %>
	
<!-- 	banner -->
	<div class="container-fluid p-0 m-0" >
		<div class="jumbotron primary-background text-white banner-background">
      <div class="container">
        <h3 class="display-4">Welcome to Tech Blog</h3>
        <p>Welcome to Technical Blog,world of Technology
          A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.

          Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Early ones preceded the invention of the digital computer, the first probably being the automatic flute player described in the 9th century by the brothers Musa in Baghdad, during the Islamic Golden Age.[1] Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos. The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.
        </p>
        <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span>Start,Its free</button>
        <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login<a>
      </div>
    </div>
  </div>
  <!--cards-->
  <div class="container">

    <div class="row">
      <div class="col-md-4 ">
         <div class="card" ">
          <div class="card-body">
            <h5 class="card-title">Java Programming</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn primary-background text-white">Read More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 ">
        <div class="card" ">
         <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
           <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
           <a href="#" class="btn primary-background text-white">Read More</a>
         </div>
       </div>
     </div>
     <div class="col-md-4 ">
      <div class="card" ">
       <div class="card-body">
         <h5 class="card-title">Java Programming</h5>
         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
         <a href="#" class="btn primary-background text-white">Read More</a>
       </div>
     </div>
   </div>
    
  
  </div>
  <div class="row">
    <div class="col-md-4 ">
       <div class="card" ">
        <div class="card-body">
          <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More</a>
        </div>
      </div>
    </div>
    <div class="col-md-4 ">
      <div class="card" ">
       <div class="card-body">
         <h5 class="card-title">Java Programming</h5>
         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
         <a href="#" class="btn primary-background text-white">Read More</a>
       </div>
     </div>
   </div>
   <div class="col-md-4 ">
    <div class="card" ">
     <div class="card-body">
       <h5 class="card-title">Java Programming</h5>
       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
       <a href="#" class="btn primary-background text-white">Read More</a>
     </div>
   </div>
 </div>
  

</div>
  </div>
  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
   <script>
    
    </script>
  </body>
</html>