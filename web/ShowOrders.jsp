<%-- 
    Document   : ShowOrders
    Created on : Apr 27, 2016, 4:48:34 PM
    Author     : shashank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="FoodAasaRe.MenuItems"%>
<%@page import="java.awt.MenuItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>User Orders</title>
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
                        <li class="active"><a href="ShowOrders.jsp"><span style="font-size: large"class="glyphicon glyphicon-shopping-cart"></span>
                            <span id="orderCount" class="label label-success"></span></a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Your Order
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>Item Name</th><th>Item Price</th><th>Quantity</th>
                        </tr>

                        <%
                            MenuItems mi=new MenuItems();
                        //Cookie[] cookies = null;
                        // Get an array of Cookies associated with this domain
                        request.getSession(false);
                        if( request.getCookies() != null ){
                            Cookie[] cookies = request.getCookies();
                            for (int i = 0; i < cookies.length; i++){
                                ResultSet rs=mi.getItemData(Integer.parseInt(cookies[i].getValue().toString()));
                                while(rs.next()){
                                    out.print("<tr><td>"+rs.getString(3)+"</td>");
                                    out.print("<td>"+rs.getString(4)+"</td>");
                                    out.print("<td><input type='number' name='quantity' value='1'></td></tr>");
                                    cookies[i].setMaxAge(0);
                                }
                            }
                        }else{
                            out.println("<h2>No orders founds</h2>");
                        }
                        %>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
</html>
