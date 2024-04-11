/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package processServlet;

import entity.User;
import helper.ConnectionProvider;
import helper.dboperation;
import java.io.File;
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
/**
 *
 * @author Admin
 */
public class ProfileImgChangeServlet extends HttpServlet {

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
            out.println("<title>Servlet ProfileImgChangeServlet</title>");
            out.println("</head>");
            out.println("<body>");
 
            HttpSession hs = request.getSession();
            User user = (User) hs.getAttribute("user");
//            out.println("crr");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {

                int user_id = user.getUser_id();
                String old_imgname = user.getProfileimg();

                Part updateprofimg = request.getPart("updateprofimg");
                String updateprofimgname = updateprofimg.getSubmittedFileName();
//                 out.println("New img name : "+updateprofimgname);
//                 out.println("id : "+user_id);
//                 out.println("Old img : "+old_imgname);
                dboperation dop = new dboperation(ConnectionProvider.getConnection());
                boolean changemethod = dop.userProfileChange(user_id, updateprofimgname);
               System.out.println("change :"+changemethod);
                if (changemethod == true) {
//                    delete old profile img
                if(old_imgname.equals("default.png"))
                {
                    System.out.println("default");
                }else{
                    File f=new File("C:/Users/Admin/Documents/NetBeansProjects/publicdaybook/web/profileimg/"+old_imgname);
                    f.delete();
                }
//                    add new profile img in folder
                    String updateprogimgpath = "C:/Users/Admin/Documents/NetBeansProjects/publicdaybook/web/profileimg/"+updateprofimgname;
                    FileOutputStream fos = new FileOutputStream(updateprogimgpath);
                    InputStream is = updateprofimg.getInputStream();
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                    user.setProfileimg(updateprofimgname);
                    response.sendRedirect("userProfile.jsp");
                }
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
