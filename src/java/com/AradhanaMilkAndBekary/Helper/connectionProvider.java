
package com.AradhanaMilkAndBekary.Helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {
    private static Connection con;
    public static Connection getConnection(){
       
        try {
             //driver class load
            if(con == null){
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myshop","root", "");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
    
}
