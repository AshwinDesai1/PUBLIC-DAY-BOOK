<%-- 
    Document   : Admincopyforusersearch
    Created on : 01-Feb-2024, 3:58:56 pm
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

        String searchval = request.getParameter("searchuser");


%>
<div class="report-body">  
    <div class="row d-flex justify-content-center">
        <div class=" col-md-11 all-detail">
            <table class="table table-hover admin-userdetails">



                <%                                try {
                        String q = null;
                        Connection con = ConnectionProvider.getConnection();
                        if (searchval != null) {
//                            q = "select *from u_registration where username like '%" + searchval + "' or username like'" + searchval + "%' or username like'%" + searchval + "%'";
                              q="select *from u_registration where username like'%"+searchval+"' or username like '"+searchval+"%' or username like '%"+searchval+"%' ";
                    } else {
                            q = "select *from u_registration where user_status='Active'";
                        }
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
                    <th>Registation Date</th>
                </tr>
                <%
                    while (rs.next()) {

                %>  
                <tr class="id-tr">
                    <td><%= rs.getInt("user_id")%></td>
                    <td><%= rs.getString("fullname")%></td>
                    <td>@<%= rs.getString("username")%></td>
                    <td><%= rs.getString("email")%></td>
                    <td>5</td>
                    <td><%= rs.getString("mobileno")%></td>
                    <td><%= rs.getString("gender")%></td>

                    <td>
                        <img
                            src="./profileimages/"
                            class="img-fluid"
                            alt=""
                            style="
                            border-radius: 50%;
                            height: 2rem;
                            width: 2rem;
                            object-fit: cover;
                            "
                            />
                    </td>
                    <td>1-jan-24</td>
                </tr>
                <%
                    }
                } else {
                %>
                <h3 class="mt-5" >User not available.</h3>
                <%
                        }

                    } catch (Exception e) {
                    }
                %>

            </table>
        </div>
    </div>
</div> 
<script src="Javascript_Files/jquery.js" type="text/javascript"></script>
<script>
    //See user post
    $(".id-tr").click(function () {
        let item1 = $(this).children();
        let id = $(item1[0]).text();
        console.log(id);

        $.ajax({
            url: "AdminUserPost.jsp",
            data: {"id": id},
            success: function (data) {
                console.log(data);
                $(".ajax-post").html(data);


            }
        })
        $($(op2)).removeAttr("style");
        $(op3).css("background", "gray");
    });
</script>
<%}%>

