<%-- 
    Document   : db
    Created on : Apr 2, 2016, 1:02:02 PM
    Author     : shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
<head>
<title>SELECT Operation</title>
</head>
<body>
       <table cellspacing="10" cellpading="5">
       <caption>Books Available</caption>
       <tr>
     <th>Id</th><th>Name</th><th>pwd</th><th>email</th>
       </tr>

  <%
      Connection con = null;
      Statement st = null;
      ResultSet rs = null;
        try
         {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql:///mydb","root", "");
            st=con.createStatement();

          st = con.createStatement();
          rs = st.executeQuery("SELECT * FROM user");

         while(rs.next())
           {
             int no = rs.getInt(1);
             String name = rs.getString(2),pwd=rs.getString(3);
             String email=rs.getString(4);
           %><tr>
               <td><%=no%></td><td><%= name%></td>
          <td><%=pwd%></td><td><%=email%></td>
          </tr>
      <%
     }
   } 
  catch (Exception ea)
         {
           System.err.println("Exception: " + ea.getMessage());
          }
    finally
          {
            try {
                 if(rs != null)
                   rs.close();
                 if(st != null)
                   st.close();
                 if(con != null)
                   con.close();
             }
            catch (SQLException ez) {
            }
         }
  %>
       </table>
</body>
</html>