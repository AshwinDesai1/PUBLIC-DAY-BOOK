<%-- 
    Document   : AdminUserPostCopy
    Created on : 06-Feb-2024, 2:51:23 pm
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    System.out.println("come into contact page");
    String adminlogin = (String) session.getAttribute("adminlogin");
    if (adminlogin == null) {
        response.sendRedirect("AdminLogin.jsp");
    } else {

%>
<div class="ajax-post">
    <div class="report-header"> 
        <h1 class="recent-Articles">User reports..</h1> 
        <!--<button class="view">View All</button>--> 
    </div> 
    <div class="report-body"> 
        <div class="row d-flex justify-content-center">
            <div class=" col-md-11 all-detail">
                <table class="table table-hover admin-userdetails">
                 
                    <%                        try {

                            Connection con = ConnectionProvider.getConnection();
                            String q = "select *from user_reports";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            if (rs.next()) {
                            %>
                               <tr>
                        <th>Id</th>
                        <th>Username</th>
                        <th>Report</th>
                        <th>Shared Date</th>
                    </tr>
                            <%
                                rs = st.executeQuery(q);
                                while (rs.next()) {

                    %>   
                    <tr class="value_tr">
                        <td class="post_id"><%= rs.getInt("r_id")%></td>
                        <td><%= rs.getString("username")%></td>
                        <td><%= rs.getString("report")%></td>
                        <td><%= rs.getString("r_date")%></td>
                        <!--<td><i class="bi bi-trash3  ms-4 remove-post" style="font-size: 1rem; color:red; cursor:pointer; "></i></td>-->
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <h3 class="mt-5" >
                        Currently not available any reports.
                        <!--<img src="User_Post/news-nt-avlbl.png" class="img-fluid" alt="alt" style="height: 20rem;"/>-->
                    </h3>
                    <%
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>

            </div> 
        </div>
    </div>
</div>
<%}%>