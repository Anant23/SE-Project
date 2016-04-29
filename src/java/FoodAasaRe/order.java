/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FoodAasaRe;

import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shashank
 */
public class order {
    
    connect con;
    Statement stmt;
    ResultSet rs,rs1;
    Vector v=new Vector();
    public order(){
        con=new connect();
        
    }
    
    public int placeOrder(int id){
        v.add(id);
        return v.size();
    }
    
    public Vector viewMyOrder(int orderId){
        Vector result=new Vector();
        String orderDetailsQuery="select userId,orderId,itemId,itemName,itemPrice from `order` natural join orderdetails natural join menuitem where orderId=1";
        String totalCost="select sum(`itemPrice`) from `order` natural join orderdetails natural join menuitem where orderid="+orderId;
        try {
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(orderDetailsQuery);
            result.add(rs);
            stmt=con.getConnect().createStatement();
            rs1=stmt.executeQuery(totalCost);
            result.add(rs1);
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
//    public static void main(String[] args) {
//        order o1=new order();
//        Vector v=o1.viewMyOrder(1);
//        ResultSet rs=(ResultSet)v.elementAt(1);
//        try {
//            while(rs.next()){
//                System.out.println(rs.getInt(1));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(order.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
}
