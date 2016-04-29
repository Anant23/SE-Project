/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FoodAasaRe;

/**
 *
 * @author user
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class connect {
     Connection con=null;
     
public Connection getConnect(){

 try{
  Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql:///resturant","root","");
     System.out.println("Conected");
  }
  catch(Exception e){}
  return con;
 }

    void Close() {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(connect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


//public static void main(String args[]){
  // new connect();
 //}
}
