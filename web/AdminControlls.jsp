<%-- 
    Document   : userRegistration
    Created on : Apr 4, 2016, 6:35:33 PM
    Author     : shashank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="FoodAasaRe.MenuItems"%>
<%@page import="java.awt.MenuItem"%>
<%@page import="java.util.Vector"%>
<%@page import="FoodAasaRe.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>user Home</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-imgupload.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-imgupload.min.css" rel="stylesheet" type="text/css">
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
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#add" aria-controls="todaysSpecial" role="tab" data-toggle="tab">Add</a></li>
                <li role="presentation"><a href="#vegMenu" aria-controls="vegMenu" role="tab" data-toggle="tab">Update</a></li>
                <li role="presentation"><a href="#nonVegMenu" aria-controls="nonVegMenu" role="tab" data-toggle="tab">Delete</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="add">
                    <!--<div class="col-md-10 col-md-offset-1">-->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Add New Food Item
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-horizontal col-md-5 col-md-offset-2">
                                <div class="form-group">
                                    <label for="menuType" class="control-label col-sm-3">Menu Type</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="menuType" name="menuType">
                                            <%
                                               MenuItems menuItems=new MenuItems();
                                               ResultSet rs=menuItems.getMenuItemTypes();
                                               while(rs.next()){
                                                   out.print("<option value="+rs.getString("menuId")+">"+rs.getString("menuType")+"</option>");
                                               }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="itemName" class="control-label col-sm-3">Item Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="itemName" name="itemName" class="form-control" placeholder="Item name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="itemPrice" class="control-label col-sm-3">Item Price</label>
                                    <div class="col-sm-9">
                                        <input type="number" id="itemPrice" name="itemPrice" class="form-control" placeholder="Price">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="imgupload panel panel-default">
                                        <div class="panel-heading clearfix">
                                            <h3 class="panel-title pull-left">Upload image</h3>
                                            <div class="btn-group pull-right">
                                                <!--<button type="button" class="btn btn-default active">File</button>-->
                                                <!--<button type="button" class="btn btn-default">URL</button>-->
                                            </div>
                                        </div>
                                        <div class="file-tab panel-body">
                                            <div>
                                                <button type="button" class="btn btn-default btn-file">
                                                    <span>Browse</span>
                                                    <input type="file" name="file-input">
                                                </button>
                                                <button type="button" class="btn btn-default">Remove</button>
                                            </div>
                                        </div>
                                        <!--<div class="url-tab panel-body">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Image URL">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default">Submit</button>
                                                </div>
                                            </div>
                                            <input type="hidden" name="url-input">
                                        </div>-->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="addItem" class="btn btn-block btn-primary">Add Item</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>

                <div role="tabpanel" class="tab-pane" id="vegMenu">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Delete Item
                        </div>
                        <div class="panel-body">
                            
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane" id="nonVegMenu">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Non Veg-Specials</div>
                        <div class="panel-body">
                            <div class="panel-body">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--<script src="js/myScript.js"></script>-->
    
    <% 
        String submit=request.getParameter("addItem");
        String itemName,itemPic="logoM.png";
        String menuType;
        float itemPrice;
        if(submit!=null){
            Vector itemData=new Vector();
            menuType=request.getParameter("menuType");
            itemName=request.getParameter("itemName");
            itemPrice=Float.parseFloat(request.getParameter("itemPrice"));
            itemData.add(menuType);
            itemData.add(itemName);
            itemData.add(itemPrice);
            itemData.add(itemPic);
            
            //out.print(menuType+" "+itemName+" "+itemPrice);
            if(menuItems.addMenuItem(itemData)){
                out.print("Item added Successfully");
            }else{
                out.print("Error in adding item");
            }
        }
    %>
    
    
    <script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-imgupload.min.js"></script>
    <script type="text/javascript">
        $('.imgupload').imgupload();
    </script>
    
    </body>
</html>