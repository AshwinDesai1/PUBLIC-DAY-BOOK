/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package processServlet;

import helper.ConnectionProvider;
import helper.dboperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class RegistrationServlet extends HttpServlet {

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

            HttpSession hs = request.getSession();
            dboperation dop = new dboperation(ConnectionProvider.getConnection());

            String fullname = request.getParameter("fname");
            String username = request.getParameter("uname");
            String city = request.getParameter("city");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String mnumber = request.getParameter("mnumber");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String friends = request.getParameter("friends");

            String existUser = dop.findExistUsername(username);
            String existEmail = dop.findExistEmail(email);
            String existMobile = dop.findExistMobile(mnumber);

            if (existUser == null && existEmail == null && existMobile == null) {
              
                
                dop.userRegistration(fullname, username, city, address, email, mnumber, password, gender,friends);
                    response.sendRedirect("login.jsp");
                }
            else
                {
             
                if (existUser != null && existEmail != null && existMobile != null) {
                    out.println("Username,Email & Mobile  Already Exist");
                    hs.setAttribute("uem_match", "Username,Email & Mobile  Already Exist");
                    response.sendRedirect("registration.jsp");
                } else if (existUser != null && existEmail != null) {
                    out.println("Username & Email Already Exist");
                    hs.setAttribute("uem_match", "Username & Email Already Exist");
                    response.sendRedirect("registration.jsp");
                } else if (existUser != null && existMobile != null) {
                    out.println("Username & Mobile Already Exist");
                    hs.setAttribute("uem_match", "Username & Mobile Already Exist");
                    response.sendRedirect("registration.jsp");
                } else if (existEmail != null && existMobile != null) {
                    out.println("Email & Mobile Already Exist");
                    hs.setAttribute("uem_match", "Email & MObile Already Exist");
                    response.sendRedirect("registration.jsp");
                } else if (existUser != null) {
                    out.println("Username Already Exist");
                    hs.setAttribute("uem_match", "Username Already Exist");
                    response.sendRedirect("registration.jsp");
                } else if (existEmail != null) {
                    out.println("Email Already Exist");
                    hs.setAttribute("uem_match", "Email Already Exist");
                    response.sendRedirect("registration.jsp");
                } else {
                    out.println("Mobileno Already exist");
                    hs.setAttribute("uem_match", "Mobile Already Exist");
                    response.sendRedirect("registration.jsp");
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
