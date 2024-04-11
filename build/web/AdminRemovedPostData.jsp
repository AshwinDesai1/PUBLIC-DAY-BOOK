<%-- 
    Document   : AdminRemovedPostData
    Created on : 07-Feb-2024, 11:43:24 am
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
        <h1 class="recent-Articles">Deleted news..</h1> 
        <!--<button class="view">View All</button>--> 
    </div> 
    <div class="report-body"> 
        <div class="row d-flex justify-content-center">
            <div class=" col-md-11 all-detail">
                <table class="table table-hover admin-userdetails">
                    <%
//                        int user_id = Integer.parseInt(request.getParameter("id"));
                        try {

                            Connection con = ConnectionProvider.getConnection();
                            String q = "select *from admin_deletedpost";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            if(rs.next()) {

                    %>   
                    <tr>
                        <th>No</th>
                        <th>Old No</th>
                        <th>User Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Shared Date</th>
                       
                    </tr>

                    <%
//                        int user_id = Integer.parseInt(request.getParameter("id"));
                             rs = st.executeQuery(q);
                            while (rs.next()) {

                    %>   
                    <tr class="value_tr">
                        <td class="post_id"><%= rs.getInt("dp_id")%></td>
                        <td class="post_id"><%= rs.getInt("dp_oldid")%></td>
                        <td class="post_id"><%= rs.getInt("dp_user_id")%></td>
                        <td><%= rs.getString("dp_title")%></td>
                        <td><%= rs.getString("dp_description")%></td>
                        <td><%= rs.getString("dp_category")%></td>
                        <td>
                            <img src="User_Post/<%= rs.getString("dp_postimg")%>" class="img-fluid" alt="alt" style="height:5rem; width:10rem; object-fit: cover "/>
                        </td>
                        <td><%= rs.getString("dp_datetime")%></td>
                       
                    </tr>
                    <%
                            }
}else{
              %>
              <h3 class="mt-5" >Currently not available any removed news.</h3>
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