<%-- 
    Document   : AdminUserPostCopy
    Created on : 06-Feb-2024, 2:51:23 pm
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String adminlogin = (String) session.getAttribute("adminlogin");
    if (adminlogin == null) {
        response.sendRedirect("AdminLogin.jsp");
    } else {
%>
<div class="ajax-post">
    <div class="report-header"> 
        <h1 class="recent-Articles">Published news..</h1> 
        <!--<button class="view">View All</button>--> 
    </div> 
    <div class="report-body"> 
        <div class="row d-flex justify-content-center">
            <div class=" col-md-11 all-detail">
                <table class="table table-hover admin-userdetails">
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Shared Date</th>
                        <th>Remove</th>
                    </tr>

                    <%
                        int user_id = Integer.parseInt(request.getParameter("id"));
                        try {

                            Connection con = ConnectionProvider.getConnection();
                            String q = "select *from user_post where user_id = '" + user_id + "' ";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            while (rs.next()) {

                    %>   
                    <tr class="value_tr">
                        <td class="post_id"><%= rs.getInt("post_id")%></td>
                        <td><%= rs.getString("title")%></td>
                        <td><%= rs.getString("description")%></td>
                        <td><%= rs.getString("category")%></td>
                        <td>
                            <img src="IMAGES/pexels-pixabay-460672.jpg" class="img-fluid" alt="alt" style="height:5rem; width:10rem; object-fit: cover "/>
                        </td>
                        <td><%= rs.getString("datetime")%></td>
                        <td><i class="bi bi-trash3  ms-4 remove-post" style="font-size: 1rem; color:red; cursor:pointer; "></i></td>
                    </tr>
                    <%
                            }

                        } catch (Exception e) {
                        }
                    %>
                </table>

            </div> 
        </div>
    </div>
</div>
<%}%>