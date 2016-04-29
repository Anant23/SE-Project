<!doctype html>
<%@page import="java.util.Vector"%>
<%@page import="FoodAasaRe.User"%>
<html>
    <head>
	<title>Hotel</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/myStyle.css" rel="stylesheet" type="text/css">
    </head>
    <body class="homebackground">
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
		
            <div class="container-fluid">
		<div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse" aria-expanded="false">
			<span class="sr-only">Toggle Navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="images/logo1.png"  height="30"/></a>
		</div>
		<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse"><!-- navbar-right: moves menue items to right side-->
                    <ul class="nav navbar-nav">
                    	<li class="active"><a href="index.html">Home</a></li>
			<li><a href="aboutus.html">About Us</a></li>
			<li><a href="#">Contact Us</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">One more separated link</a></li>
                            </ul>
			</li>
                    </ul>
		</div>
            </div>
	</nav>
		
        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-primary topMargin">
                    <div class="panel-heading">User Log In</div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <input class="form-control" type="text" name="email" placeholder="Email Id" required="required">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="password" id="password" placeholder="Passowrd" required="required">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" name="login" value="login">LogIn</button>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <a href="userRegistration.jsp">Not a Member?</a>
                    </div>
                </div>
            </div>
        </div>
        
        
        <% 
        String submit=request.getParameter("login");
        String email,password;
        User u=new User();
        if(submit!=null){
            Vector userData=new Vector();
            
            email=request.getParameter("email");
            
            password=request.getParameter("password");
            
            userData.add(email);
            userData.add(password);
            if(u.login(userData)){
                out.print("<script>window.location.href ='userHome.jsp';</script>");
            }else{
                out.print("Error in login");
            }
        }
    %>
	
        
	<script src="js/jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    </body>
</html>