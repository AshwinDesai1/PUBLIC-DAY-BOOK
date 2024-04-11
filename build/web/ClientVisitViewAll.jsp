<%-- 
    Document   : viewall
    Created on : 30-Jan-2024, 4:11:55 pm
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Re-use_Pages/All_links.jsp" %>
        <link href="./All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./All_Css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    
    
    <body>
         <%@include file="navbar.jsp" %>
        
        <%
        int user_id=Integer.parseInt(request.getParameter("user_id"));
        
        %>
        
          <div class="container-fluid">
      <div class="row">
          <%   
                    
                   

                    Connection con = ConnectionProvider.getConnection();
                    try {
                        String q1 = null;
                            q1 = "select *from user_post where user_id='" + user_id + "'";

                      
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(q1);
                        while (rs.next()) {
               
                            String desc = rs.getString("description");
                            if (desc.length() > 80) {
                                desc = desc.substring(0, 70);

                            }
                            String q2 = "select username,profileimg from u_registration where user_id='" + user_id + "'";
                            Statement st1 = con.createStatement();
                            ResultSet rs1 = st1.executeQuery(q2);
                            while (rs1.next()) {
                                String user_name = rs1.getString("username");
                                String user_profileimg = rs1.getString("profileimg");


                %>
          
        <div class="col-md-3 col-xl-3 col-sm-5 mb-4 our_card">
          <div class="card">
            <div class="card__header">
              <img
                src="./User_Post/<%=rs.getString("post_img")%>"
                alt="card__image"
                class="card__image"
                width="600" style="object-fit: contain;"
              />
            </div>
            <div class="card__body" >
              <span class="tag tag-blue"><%=rs.getString("category")%></span>
              <h4 ><%=rs.getString("title")%></h4>
              <p>
                <%=desc%>
              </p>
              <form action="FullPost.jsp" method="post">
              <input type="hidden" name="fullpost" value="<%=rs.getInt("post_id")%>" />
              <button type="submit" class="button-34" role="button">Read more..</button>
              </form>
            </div>

            <div class="card__footer">
              <div class="user">
                <img src="./profileimg/<%=user_profileimg%>" alt="" style="border-radius:50%; height: 2rem; width: 1.6rem;">
                <div class="user__info">
                    <h5 style="font-size: 0.8rem">@<%=user_name%></h5>
                </div>
              </div>
            </div>
            <div class="date-time">
              <p><%= rs.getString("datetime")%></p>
            </div>
            <div class="like-icon comm-icon">
              <i class="bi bi-suit-heart"></i>
            </div>
          </div>
        </div>
                 <%
                            }
                        }
                    } catch (Exception e) {
                    }
                %>

        
      </div>
    </div>
        <script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
        <script src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
            <script>
               let card = $(".our_card");
            console.log("card" + card.length);
            if (card.length == 1)
            {
                $(card[0]).removeAttr("class");
                $(card[0]).attr("class", "col-md-5 col-xl-6 col-sm-5 mb-4 our_card")
            }
            </script>

    </body>
</html>
