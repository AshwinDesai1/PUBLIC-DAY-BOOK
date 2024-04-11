/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package processServlet;

import entity.User;
import helper.ConnectionProvider;
import helper.dboperation;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class UserPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserPostServlet</title>");
            out.println("</head>");
            out.println("<body>");

            HttpSession hs = request.getSession();
            User user = (User) hs.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String category = request.getParameter("category");
                Part posimg = request.getPart("postimg");
                String postimgname = posimg.getSubmittedFileName();
                System.out.println("post image name ----- "+postimgname);
                String postpath = "C:/Users/Admin/Documents/NetBeansProjects/publicdaybook/web/User_Post/" + postimgname;
               try
               {
                FileOutputStream fos = new FileOutputStream(postpath);
                InputStream is = posimg.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
               }catch(Exception e)
               {
                   e.printStackTrace();
               }
                dboperation db = new dboperation(ConnectionProvider.getConnection());
                db.userPost(user.getUser_id(), title, description, category, postimgname);
                response.sendRedirect("index.jsp");
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
