/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FoodAasaRe;

import java.sql.*;
import java.util.Vector;
import javax.management.Query;

/**
 *
 * @author shashank
 */
public class MenuItems {
    connect con;
    Statement stmt;
    ResultSet rs;
    
    public MenuItems(){
        con=new connect();
    }
    
    public ResultSet getVegMenuItems(){
        String query="SELECT * FROM menu natural join menuitem where menuId='m101'";
        try{
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(query);
            return rs;
        }catch(Exception e){
            return null;
        }
    }
    
    public ResultSet getNonVegMenuItems(){
        String query="SELECT * FROM menu natural join menuitem where menuId='m102'";
        try{
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(query);
            return rs;
        }catch(Exception e){
            return null;
        }
    }
    
    public ResultSet getMenuItemTypes(){
        String query="SELECT * FROM menu";
        try{
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(query);
            return rs;
        }catch(Exception e){
            return null;
        }
    } 
    
    public boolean addMenuItem(Vector v){
        System.out.println(v.elementAt(0)+" "+v.elementAt(1)+" "+v.elementAt(2));
        String query ="insert into menuitem(menuId,itemName,itemPrice) "
                +"values('"+v.elementAt(0)+"','"+v.elementAt(1)+"',"+v.elementAt(2)+")";
        try{
            stmt=con.getConnect().createStatement();
            stmt.executeUpdate(query);
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
    public ResultSet getItemData(int itemId){
        String query="SELECT * FROM menuitem where itemId="+itemId;
        try{
            stmt=con.getConnect().createStatement();
            rs=stmt.executeQuery(query);
            return rs;
        }catch(Exception e){
            return null;
        }
    }
    
    public static void main(String[] args) {
        MenuItems mi=new MenuItems();
//        Vector v=new Vector();
//        v.add("m101");
//        v.add("Chana Masala");
//        v.add(40.0);
//        if(mi.addMenuItem(v))
//            System.out.println("Done");
//        else
//            System.out.println("Error");
    }
}
