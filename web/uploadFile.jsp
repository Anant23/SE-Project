<%-- 
    Document   : uploadFile
    Created on : Apr 8, 2016, 11:24:50 AM
    Author     : shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="uploader" enctype="multipart/form-data" name="form1">
            <input name="file" type="file"/>
            <button type="submit">Upload</button>
        </form>
    </body>
</html>
