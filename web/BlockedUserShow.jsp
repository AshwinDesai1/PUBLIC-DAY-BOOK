<%-- 
    Document   : BlockedUserShow
    Created on : 09-Feb-2024, 1:58:50 pm
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
        <h1 class="recent-Articles">Blocked Users</h1> 
        
    </div> 

    <div class="report-body" > 
        <div class="row d-flex justify-content-center">
            <div class=" col-md-11 all-detail">
                <table class="table table-hover admin-userdetails">
                     <%
                        try {

                            Connection con = ConnectionProvider.getConnection();
                            String q = "select *from blockuser_admin";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            if (rs.next()) {

                    %> 
                    <tr>
                        <th>Id</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Total Post</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                        <th>Profile</th>
                        <th>Blocked Date</th>

                    </tr>


                    <%
                       

                           rs=st.executeQuery(q);
                            while (rs.next()) {

                    %> 
                    <tr class="id-tr">
                        <td><%= rs.getInt("blk_id")%></td>
                        <td><%= rs.getString("full_name")%></td>
                        <td>@<%= rs.getString("username")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td>5</td>
                        <td><%= rs.getString("mobileno")%></td>
                        <td><%= rs.getString("gender")%></td>

                        <td>
                            <img
                                src="./profileimg/<%= rs.getString("profileimg")%>"
                                class="img-fluid"
                                alt=""
                                style="
                                border-radius: 50%;
                                height: 2.4rem;
                                width: 2rem;
                                object-fit: cover;
                                "
                                />
                        </td>
                        <td><%= rs.getString("blk_datetime")%></td>
                    </tr>
                    <%
                            }
}else{
%>
<h3 class="mt-5" >
    Currently any blocked user not available.
</h3>
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