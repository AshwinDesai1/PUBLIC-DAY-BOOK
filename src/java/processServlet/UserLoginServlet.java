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
import entity.*;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

public class UserLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserLoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("come into login servlet");
            HttpSession hs = request.getSession();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean b=true;
            dboperation db = new dboperation(ConnectionProvider.getConnection());
            User u = new User();
            String qtr = "select * from u_registration where email='" + email + "' and user_status='Blocked'";
            try {
                Statement st = ConnectionProvider.getConnection().createStatement();
                ResultSet rs = st.executeQuery(qtr);
                if (rs.next()) {
                    hs.setAttribute("uem_match", "you are blocked not login");
                   b=false;
                }
                  
                u = db.findUser(email, password);
                out.println("user=" + u);
                if (u == null) {
                    hs.setAttribute("error", "loginerr");
                    b=false;
                } 
                   
                
                if(b==true)
                {
                     hs.setAttribute("user", u);
                     response.sendRedirect("./index.jsp");
                }
                else
                {
                    response.sendRedirect("./login.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
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
