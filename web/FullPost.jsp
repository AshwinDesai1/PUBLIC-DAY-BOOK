<%-- 
    Document   : FullPost
    Created on : 19-Jan-2024, 4:27:57 pm
    Author     : Admin
--%>
<%@page import="java.sql.*"%>
<%@page import="helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="All_Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .card {
                height:auto;
                padding: 0px;
                
            }
           
        </style>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <%
            User user = (User) session.getAttribute("user");

//            if (user == null) {
//                response.sendRedirect("login.jsp");
//            } else {

                String post_id = request.getParameter("fullpost");
                Connection con = ConnectionProvider.getConnection();
                String q = "select *from user_post where post_id='" + post_id + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(q);
                while (rs.next()) {


        %>
        <!--                <div class="container-fluid">
                            <div class="row" 
                                 <div class="col-md-10 col-xl-3 col-sm-5 mb-4">
                                    <div class="card" style="width: 35rem;padding: 1rem">
                                        <img src="User_Post/<%=rs.getString("post_img")%>" style="height: 15rem" alt="post img"/>
                                       <div class="card__body" >
                                        <span class="tag tag-blue" style="margin-top: 1rem"><%=rs.getNString("category")%></span>
                                        <h4><%=rs.getNString("title")%></h4>
                                        <p> <%=rs.getNString("description")%> </p>
                                        <p><%= rs.getString("datetime")%></p>
                                    </div> 
                                    </div>
                                    
                                </div>
                            </div>-->
       
        <div class="container-fluid">
            <div class="row" style="width: 30rem"
                 <div class="col-md-10 col-xl-3 col-sm-5 mb-4">
                    <div class="card" style="position: relative">
                        <div class="card__header">
                            <img
                                src="User_Post/<%=rs.getString("post_img")%>" style="height: 15rem;"
                                alt="card__image"
                                class="card__image"
                                width="600" style="object-fit: fill;"

                                />
                        </div>
                        <!--<div class="card__body" >-->
                        <span class="tag tag-blue ms-2 mt-3"><%=rs.getNString("category")%></span>
                        <h4 class="ms-2 mt-1" ><%=rs.getNString("title")%></h4>
                        <p class="ms-2 ">
                           <%=rs.getNString("description")%>
                        </p>
                        <div class="date-time pt-1" style="margin-left:1.2rem;position: absolute;left: -0.6 rem;">
                            <p><%= rs.getString("datetime")%></p>
                            <!--</div>-->
                        </div>
                    </div>
                </div>
            </div>


            <script src="bootstrap.bundle.js" type="text/javascript"></script>

            <%
                }
//                }
            %>
    </body>
</html>
