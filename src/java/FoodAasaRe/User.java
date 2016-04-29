/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FoodAasaRe;

import java.sql.*;
import java.util.Vector;


/**
 *
 * @author shashank
 */
public class User {
    
    connect con;
    Statement stmt;
    ResultSet rs;
    
    public User(){
        try{
            con=new connect();
            //stmt=con.getConnect().createStatement();
        }catch(Exception e){
            
        }
    }
    
    public Object getUser(Vector data){
        return data.elementAt(0);
    }
    
    public boolean addUser(Vector data){
        String query="insert into user(name,email,contactNumber,password) values('"+data.elementAt(0)+"',"
                + "'"+data.elementAt(1)+"',"+Integer.parseInt(data.elementAt(2).toString())+","
                + "'"+data.elementAt(3)+"')";
        try {
            stmt=con.getConnect().createStatement();
            stmt.executeUpdate(query);
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean login(Vector data){
        String query="select * from user where email='"+data.elementAt(0)+"' and password='"+data.elementAt(1)+"' limit 1";
        try {
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(query);
            
            if(!rs.next()){
                return false;
            }else{
                return true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Error:"+ex);
            return false;
        }
    }
    
//    public static void main(String[] args) {
//        User u=new User();
//        Vector data=new Vector();
//        data.add("samwinchester@supernatural.com");
//        data.add("sampass");
//        System.out.println("login:"+u.login(data));
//    }
}

