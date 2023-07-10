/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.AradhanaMilkAndBekary.Servlet;

import com.AradhanaMilkAndBekary.Dao.UserDao;
import com.AradhanaMilkAndBekary.Entities.User;
import com.AradhanaMilkAndBekary.Helper.Hepler;
import com.AradhanaMilkAndBekary.Helper.connectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
public class editProfileServlet extends HttpServlet {

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
            String cName = request.getParameter("cName");
            String cMoNo = request.getParameter("cMoNo");
            String cPass = request.getParameter("cPass");
            Part part = request.getPart("profile");
            String imageName = part.getSubmittedFileName();

            UserDao dao = new UserDao(connectionProvider.getConnection());
            if (imageName == "") {
                //Part part = request.getPart("profile");
                //String imageName = part.getSubmittedFileName();

                HttpSession s = request.getSession();
                User user = (User) s.getAttribute("currentuser");
                user.setName(cName);
                user.setMoNo(cMoNo);
                user.setPassword(cPass);
                dao.editUser(user);
                response.sendRedirect("Profile.jsp");

            } else {

                HttpSession s = request.getSession();
                User user = (User) s.getAttribute("currentuser");
                user.setName(cName);
                user.setMoNo(cMoNo);
                user.setPassword(cPass);
                String oldImage = user.getProfile();
                user.setProfile(imageName);
                if (dao.editUserWithProfile(user)) {
                    String path1 = request.getRealPath("/") + "pics" + File.separator + oldImage;
                    String path2 = request.getRealPath("/") + "pics" + File.separator + imageName;
                    if (Hepler.deleteImg(path1)) {
                        Hepler.saveImg(part.getInputStream(), path2);
                        response.sendRedirect("Profile.jsp");
                    }
                }
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
