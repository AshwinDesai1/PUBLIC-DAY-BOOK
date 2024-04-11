<%-- 
    Document   : BlockUserAdmin
    Created on : 08-Feb-2024, 3:44:55 pm
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
        <h1 class="recent-Articles">Recent users</h1> 
        <button class="view">View All</button> 
    </div> 

    <div class="report-body" > 
        <div class="row d-flex justify-content-center">
            <div class=" col-md-11 all-detail">
                <table class="table table-hover admin-userdetails">
                    <tr>
                        <th>Id</th>
                        <th>See Post</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Total Post</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                        <th>Profile</th>
                        <th>Registation Date</th>
                        <th>Block</th>
                    </tr>


                    <%
                        try {

                            Connection con = ConnectionProvider.getConnection();
                            String q = "select *from u_registration ";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            while (rs.next()) {

                    %> 
                    <tr class="id-tr">
                        <td><%= rs.getInt("user_id")%></td>
                        <td ><i class="bi bi-eye see-post"  style="color:#ff7900;cursor: pointer;"></i></td>
                        <td><%= rs.getString("fullname")%></td>
                        <td>@<%= rs.getString("username")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td>5</td>
                        <td><%= rs.getString("mobileno")%></td>
                        <td><%= rs.getString("gender")%></td>

                        <td>
                            <img
                                src="profileimg/ak.jpeg"
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
                        <td>1-jan-24</td>
                        <td><i class="bi bi-ban block-btn" style="color: black!important;font-size: 1rem;" ></i></td>
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