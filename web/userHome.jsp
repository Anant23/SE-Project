<%-- 
    Document   : userRegistration
    Created on : Apr 4, 2016, 6:35:33 PM
    Author     : shashank
--%>

<%@page import="FoodAasaRe.order"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="FoodAasaRe.MenuItems"%>
<%@page import="java.awt.MenuItem"%>
<%@page import="java.util.Vector"%>
<%@page import="FoodAasaRe.User"%>
<%@page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <title>user Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css">
        
        <script>
            var count=0;
            function addTorder(g){
                count++;
                $('#orderCount').text(count);
                document.cookie=g.value+"="+g.value+";path=/";
            }
            
            
            
        </script>
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
                        <li class="active"><a href="ShowOrders.jsp"><span style="font-size: large"class="glyphicon glyphicon-shopping-cart"></span>
                            <span id="orderCount" class="label label-success"></span></a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <div class="container">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#todaysSpecial" aria-controls="todaysSpecial" role="tab" data-toggle="tab">Todays Special</a></li>
                <li role="presentation"><a href="#vegMenu" aria-controls="vegMenu" role="tab" data-toggle="tab">Veg-Menu</a></li>
                <li role="presentation"><a href="#nonVegMenu" aria-controls="nonVegMenu" role="tab" data-toggle="tab">Non-Veg</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="todaysSpecial">
                    <!--<div class="col-md-10 col-md-offset-1">-->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Veg Special
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-condensed">
                                <tbody>
                                    <tr><th>Item name</th><th>Price</th><th>Pic</th><th>Order</th></tr>
                                    <% 
                                        MenuItems menuItem=new MenuItems();
                                        ResultSet rs=menuItem.getVegMenuItems();
                                        while(rs.next()){
                                            out.print("<form><tr><td>"+rs.getString("itemName")+"</td><td>"
                                                    +rs.getFloat("itemPrice")+ "<td></td><td>"
                                                    + "<button name='order' onclick='addTorder(this)' class='btn btn-primary' type='button' value="+rs.getInt("itemId")+">"
                                                    + "Add To Order</button></td></tr></form>");
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Non Veg-Specials</div>
                        <div class="panel-body">
                            <div class="panel-body">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <tbody>
                                        <tr><th>Item name</th><th>Price</th><th>Pic</th><th>Order</th></tr>
                                        <% 

                                            ResultSet rs1=menuItem.getNonVegMenuItems();
                                            while(rs1.next()){
                                                out.print("<form><tr><td>"+rs1.getString("itemName")+"</td><td>"
                                                        +rs1.getFloat("itemPrice")+ "<td></td>"
                                                        + "<td><button name='order'onclick='addTorder(this)' class='btn btn-primary' type='button' value="+rs1.getInt("itemId")+">"
                                                        + "Add To Order</button></td></tr></form>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--</div>-->
                </div>

                <div role="tabpanel" class="tab-pane" id="vegMenu">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Veg Special
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-condensed">
                                <tbody>
                                    <tr><th>Item name</th><th>Price</th><th>Pic</th><th>Order</th></tr>
                                    <% 
                                        ResultSet rs2=menuItem.getVegMenuItems();
                                        while(rs2.next()){
                                            out.print("<form><tr><td>"+rs2.getString("itemName")+"</td><td>"
                                                +rs2.getFloat("itemPrice")+ "<td></td><td>"
                                                + "<button value="+rs2.getInt("itemId")+"class='btn btn-primary' name='order' onclick='addTorder(this)' type='button'>Order</button></td></tr></form>");
                                        }
                                    %>
                                </tbody>
                            </table>
                            </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane" id="nonVegMenu">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Non Veg-Specials</div>
                        <div class="panel-body">
                            <div class="panel-body">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <tbody>
                                        <tr><th>Item name</th><th>Price</th><th>Pic</th></tr>
                                        <% 

                                            ResultSet rs3=menuItem.getNonVegMenuItems();
                                            while(rs3.next()){
                                                out.print("<form><tr><td>"+rs3.getString("itemName")+"</td><td>"
                                                        +rs3.getFloat("itemPrice")+ "</tr>"
                                                        + "<button value="+rs3.getInt("itemId")+" class='btn btn-primary' name='order' onclick='addTorder(this)' type='button'>Order</button></td></tr></form>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
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
                out.print("Loged in Successfully");
            }else{
                out.print("Error in login");
            }
        }
        
        String order=request.getParameter("order");
        
        if(order!=null){
            
            Cookie[] cookies = null;
            // Get an array of Cookies associated with this domain
            cookies = request.getCookies();
            if( cookies != null ){
                out.println("<h2> Found Cookies Name and Value</h2>");
                for (int i = 0; i < cookies.length; i++){
                    
                    out.print("Name : " + cookies[i].getName( ) + ", ");
                    out.print("Value: " + cookies[i].getValue( )+" <br/>");
                }
            }else{
                out.println("<h2>No cookies founds</h2>");
            }
            
        }
        
        //String addO=request.getAttribute("order").toString();
        //out.print(addO);
    %>
    
    </body>
</html>