
package com.AradhanaMilkAndBekary.Dao;

import com.AradhanaMilkAndBekary.Entities.User;
import java.sql.Connection;
import java.sql.*;

public class UserDao {
    private Connection con;    
    boolean f=false;
    public UserDao(Connection con){
        this.con=con;
    }
    
    
    //insert data inti User
    public boolean saveUser(User user){
        try {
            String q = "insert into user(name,mobileNo,password,gender,address,email,profile) values (?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, user.getName());
            pst.setString(2, user.getMoNo());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAddress());
            pst.setString(6, user.getEmail());
            pst.setString(7, user.getProfile());
            pst.executeUpdate();
            
            
             f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;  
    }
    public boolean saveUserWithOutProfile(User user){
        try {
            System.out.println(user.getGender());
            String q = "insert into user(name,mobileNo,password,gender,address,email) values (?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, user.getName());
            pst.setString(2, user.getMoNo());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAddress());
            pst.setString(6, user.getEmail());
            pst.executeUpdate();
            
            
             f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;  
    }
    
    public User getUserById(String email,String pass){
        User user=null;
        try {
            String q = "select * from user where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, email);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            System.out.println(email+pass);
            if(rs.next())
            {
                user=new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setMoNo(rs.getString("mobileNo"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setProfile(rs.getString("profile"));
                
            }
            else
            {
                System.out.println(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean editUser(User user){
        boolean f= false;
        try {
            String q = "update user set name=?,mobileNo=?, password=? where email=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, user.getName());
            pst.setString(2, user.getMoNo());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getEmail());
            pst.executeUpdate();
            f=true;
            System.out.println("No Profile");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
     public boolean editUserWithProfile(User user){
        boolean f= false;
        try {
            String q = "update user set name=?,mobileNo=?, password=?, profile=? where email=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, user.getName());
            pst.setString(2, user.getMoNo());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getProfile());
            pst.setString(5, user.getEmail());
            pst.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean getUserByEmailOrMobileNo(String email,String MoNo){
        boolean f= true;
        try {
            String q = "select * from user where email=? or mobileNo=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, email);
            pst.setString(2, MoNo);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                f=false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
}
