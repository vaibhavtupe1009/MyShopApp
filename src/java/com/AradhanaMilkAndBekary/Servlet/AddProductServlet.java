/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.AradhanaMilkAndBekary.Servlet;

import com.AradhanaMilkAndBekary.Dao.ProductDao;
import com.AradhanaMilkAndBekary.Entities.Massage;
import com.AradhanaMilkAndBekary.Entities.Product;
import com.AradhanaMilkAndBekary.Helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String pName=request.getParameter("pName");
            float bPrice= Float.parseFloat(request.getParameter("pbPrice"));
            float sPrice= Float.parseFloat(request.getParameter("psPrice"));
            int quantity= Integer.parseInt(request.getParameter("pQuantity"));
            String disc = request.getParameter("pDis");
            float bPricePU;
            bPricePU=bPrice/quantity;
            System.out.println(pName);
            
            Product product =new Product(pName, bPricePU, sPrice, disc, quantity);
            ProductDao dao = new ProductDao(connectionProvider.getConnection());
            if(dao.addProduct(product)){
                Massage ms = new Massage("Product Added Successfully", "success", "alert-success");
                HttpSession s=request.getSession();
                s.setAttribute("Msg", ms);
                out.print("Done");
                
            }
            else{
                out.print("Not Done");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
