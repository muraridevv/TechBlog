<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
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

    <main class="primary-background p-5 banner-background" >
        <div class="container">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header ">
                        <span class="fa fa-2x fa-user-plus"></span>
                        Register Here
                    </div>
                    <div class="card-body">
                        <form id="reg_form" action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="user_name">Your Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
                                
                              </div>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input   name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                              <small id="emailHelp"  class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Create Password</label>
                              <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Gender</label>
                                <input type="radio" id="male" name="gender" value="male">Male
                                <input type="radio" id="female" name="gender" value="female">Female 
                              </div>
                              <div class="form-group">
                              	<textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about you"></textarea>
                              </div>
                            <div class="form-group form-check">
                              <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">Accept Terms and Condition</label>
                            </div>
                            <div class="container text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-2x"></span>
                                <h4>Please wait...</h4>
                            </div>
                            
                            <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                          </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </main>


     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    
   <script>
    	$(document).ready(function(){
    		console.log("loaded...");
    		
    		$('#reg_form').on('submit',function (event){
    			event.preventDefault();
    			
    			let form=new FormData(this);
    			$("#submit-btn").hide();
    			$("#loader").show();
    			
    			//send registerServlet
    			$.ajax({
    				url:"RegisterServlet",
    				type:'post',
    				data: form,
    				success:function(data,textStatus,jqXHR){
    					console.log(data)
    					
    					$("#submit-btn").show();
    	    			$("#loader").hide();
    	    			
    	    			if(data.trim()==='done'){
	    	    			swal("Registered Successfully... We are redirectoring to Login Page")
	    	    			.then((value) => {
	    	    			  window.location="login_page.jsp"
	    	    			});
    	    			}else{
    	    				swal(data);
    	    			}
    				},	
    				error:function(jqXHR,textStatus,errorThrown){
    					console.log(jqXHR)
    					$("#submit-btn").show();
    	    			$("#loader").hide();
    	    			
    	    			swal("Something went wrong...Try Again!")
    	    			
    				},
    				processData:false,
    				contentType:false
    			});
    		});
    	});
    </script>
</body>
</html>