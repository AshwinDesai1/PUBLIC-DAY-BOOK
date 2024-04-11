/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package processServlet;

import entity.User;
import helper.ConnectionProvider;
import helper.dboperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class UpdateProfileInfoServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProfileInfoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession hs=request.getSession();
            User user=(User)hs.getAttribute("user");
//            if(user==null)
//            {
//            response.sendRedirect("login.jsp");
//            }
            
            String newFullName=request.getParameter("edit_fullname");
            String newUserName=request.getParameter("edit_username");
            String newGender=request.getParameter("edit_gender");
            String newCity=request.getParameter("edit_city");
            String newAddress=request.getParameter("edit_address");
            String newMobileno=request.getParameter("edit_mobile");
            
            int user_id=user.getUser_id();
            String oldFullName=user.getFull_name();
            String oldUserName=user.getUser_name();
            String oldGender=user.getGender();
            String oldCity=user.getCity();
            String oldAddress=user.getAddress();
            String oldMobileno=user.getMobileno();
            
        
            
            dboperation dop=new dboperation(ConnectionProvider.getConnection());
            
            String matchUser=dop.findExistUsername(newUserName);
            
            if(matchUser==null){
            dop.updateUserProfileInfo(user_id, newFullName, newUserName, newGender, newCity, newAddress, newMobileno);
            out.println("id = "+user.getUser_id()+"data updated");
            
            user.setFull_name(newUserName);
            user.setUser_name(newUserName);
            user.setCity(newCity);
            user.setMobileno(newMobileno);
            user.setAddress(newAddress);
            user.setGender(newGender);
            response.sendRedirect("userProfile.jsp");
            }
            response.sendRedirect("");
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
