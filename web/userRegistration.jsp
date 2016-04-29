<%-- 
    Document   : userRegistration
    Created on : Apr 4, 2016, 6:35:33 PM
    Author     : shashank
--%>

<%@page import="java.util.Vector"%>
<%@page import="FoodAasaRe.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
                        data-target="#bs-example-navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button><!-- navbar-header is used to show the menubar on small devices-->

                                    <!-- Web Page Logo goes here-->
                    <a class='navbar-brand' href='/GroupStudies'>App Home</a>
                </div>
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse"><!-- navbar-right: moves menue items to right side-->
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/GroupStudies">Home</a></li>
                        <li><a href="aboutus.html">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <div class="container">
            <div class="col-md-7 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">User Registration</div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <input class="form-control" type="text" name="name" id="firstName" placeholder="First name" required="required">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="email" name="email" id="email" placeholder="Email" required="required">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="number" name="contactNumber" id="contactNumber" placeholder="Contact Number" required="required">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="password" id="password" placeholder="Passowrd" required="required">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block" name="register" value="register">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
    
    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <% 
        String submit=request.getParameter("register");
        String username,email,contactNumber,password;
        User u=new User();
        if(submit!=null){
            Vector userData=new Vector();
            username=request.getParameter("name");
            email=request.getParameter("email");
            contactNumber=request.getParameter("contactNumber");
            password=request.getParameter("password");
            userData.add(username);
            userData.add(email);
            userData.add(contactNumber);
            userData.add(password);
            if(u.addUser(userData)){
                out.print("<script>window.location.href ='index.jsp';</script>");
            }else{
                out.print("Error in registration");
            }
        }
    %>
    
    
    </body>
</html>

