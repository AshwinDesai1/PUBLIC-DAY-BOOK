<%-- 
    Document   : index.jsp
    Created on : 25-Jan-2024, 3:04:13 pm
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="../Re-use_Pages/All_links.jsp" %>
        
        <link href="../font/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <link href="../All_Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="../All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../Re-use_Pages/navbar.jsp" %>
       <div class="d-flex justify-content-center">
      <div class="search" >
        <input style="background: #ffffff;"
          type="text"
          class="search-input"
          placeholder="search news..."
          name=""
        />
        <a href="#" class="search-icon">
          <i class="fa fa-search"></i>
        </a>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
          <%   
                    
                    String category = (String) session.getAttribute("category");

                    Connection con = ConnectionProvider.getConnection();
                    try {
                        String q1 = null;
                        if (category == null) {
                            q1 = "select *from user_post";
                        } else if (category.equals("All")) {
                            q1 = "select *from user_post";
                        } else {
                            q1 = "select *from user_post where category='" + category + "'";

                        }
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(q1);
                        while (rs.next()) {
                            int user_id = rs.getInt("user_id");
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
          
        <div class="col-md-3 col-xl-3 col-sm-5 mb-4">
          <div class="card">
            <div class="card__header">
              <img
                src="../User_Post/<%=rs.getString("post_img")%>"
                alt="card__image"
                class="card__image"
                width="600"
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
                <img src="../profileimg/<%=user_profileimg%>" alt="" style="border-radius:50%; height: 2rem; width: 1.6rem;">
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
    <footer class="footer-section">
      <div class="container">
        <div class="footer-cta pt-5 pb-5">
          <div class="row">
            <div class="col-xl-4 col-md-3 mb-30">
              <div class="single-cta">
                <i class="fas fa-map-marker-alt"></i>
                <div class="cta-text">
                  <h4>Find us</h4>
                  <span
                    >1010 Business-Word,<br />
                    opposite jalaram temple,<br />
                    Deesa</span
                  >
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-md-3 mb-30">
              <div class="single-cta">
                <i class="fas fa-phone"></i>
                <div class="cta-text">
                  <h4>Call us</h4>
                  <span>+91 8780283086</span>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-md-3 mb-30">
              <div class="single-cta">
                <i class="far fa-envelope-open"></i>
                <div class="cta-text">
                  <h4>Mail us</h4>
                  <span>pubicdaybook@info.com</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyright-area">
        <div class="container">
          <div class="row">
            <div class="col-xl-6 col-lg-6 text-center text-lg-left">
              <div class="copyright-text">
                <p>
                  Copyright &copy; 2024, All Right Reserved
                  <a href="index.html">publicdaybook</a>
                </p>
              </div>
            </div>
            <div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
              <div class="footer-menu">
                <ul>
                  <li><a href="#">Home</a></li>
                  <li><a href="#">About</a></li>
                  <li><a href="#">Post</a></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
       <script src="../Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
    </body>
</html>
