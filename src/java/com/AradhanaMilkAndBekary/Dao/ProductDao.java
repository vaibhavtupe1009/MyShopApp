
package com.AradhanaMilkAndBekary.Dao;

import com.AradhanaMilkAndBekary.Entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    
    private Connection con;
    boolean f=false;

    public ProductDao(Connection con) {
        this.con = con;
    }
    
    public boolean addProduct(Product product){
        
        try {
            String q="insert into product(name,buyPrice,salePrice,pDis,quantity) values (?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, product.getName());
            pst.setDouble(2, product.getBuyPrice());
            pst.setDouble(3, product.getSalePrice());
            pst.setString(4, product.getpDis());
            pst.setInt(5, product.getQuantity());
            pst.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Product> getAllProduct(){
        List<Product> list= new ArrayList<>();
        try {
            String q="select * from product";
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("id");
                String pName=rs.getString("name");
                float bPrice=rs.getFloat("buyPrice");
                float sPrice=rs.getFloat("salePrice");
                String pDisc= rs.getString("pDis");
                int pQuantity=rs.getInt("quantity");
                Product p = new Product(pid, pName, bPrice, sPrice, pDisc, pQuantity);
                list.add(p);
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  
    }
    
    public boolean updateStockById(int id, float buyPrice, float salePrice, int quantity){
        boolean f=false;
        int newQuantity=0;
        float newBuyPrice=0;
        try {
            String q = "select quantity from product where id=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                newQuantity = rs.getInt("quantity");
            }
            newQuantity = newQuantity + quantity;
            newBuyPrice = buyPrice/quantity;
            
            if(newQuantity != 0){
                String uq="update product set buyPrice=?, salePrice=?, quantity=? where id=?";
                PreparedStatement pst1 = con.prepareStatement(uq);
                pst1.setFloat(1, newBuyPrice);
                pst1.setFloat(2, salePrice);
                pst1.setInt(3,newQuantity);
                pst1.setInt(4, id);
                int r = pst1.executeUpdate();
                if(r==1){
                    f=true;
                }else
                {
                    System.err.println("Stock Not Updated");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}
