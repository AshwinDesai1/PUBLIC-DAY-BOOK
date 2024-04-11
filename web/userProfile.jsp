<%-- 
    Document   : userProfile
    Created on : 25-Jan-2024, 3:36:47 pm
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
        <link href="./All_Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="./All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./font/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <style>
            html,
            body {
                background: #efefef;
                font-family: "Arial";
            }

            .container {
                max-width: 1000px;
                margin: 30px auto 30px;
                padding: 0 !important;
                width: 80%;
                background-color: #fff;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.10), 0 3px 6px rgba(0, 0, 0, 0.10);
            }

            header {
                /* background: #eee; */
                /* background-image: url("https://images.pexels.com/photos/1731427/pexels-photo-1731427.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"); */
                background: #ff7900;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                height: 130px;
            }

            header i {
                position: relative;
                cursor: pointer;
                right: -96%;
                top: 25px;
                font-size: 18px !important;
                color: #fff;
            }

            @media (max-width:800px) {
                header {
                    height: 150px;
                }

                header i {
                    right: -90%;
                }
            }

            main {
                padding: 20px 20px 0px 20px;
            }

            .left {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }

            .photo {
                object-fit: cover;
                width: 8.5rem;
                height: 10rem;
                margin-top: -120px;
                border-radius: 50%;
                border: 4px solid #fff;
            }

            @media (max-width:990px) {
                .active {
                    right: calc(50% - 60px);
                    top: 50px;
                }
            }

            .name {
                margin-top: 20px;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
                font-size: 1.2rem;
                color: #777;
            }

            .info {
                margin-top: -5px;
                margin-bottom: 5px;
                font-family: 'Montserrat', sans-serif;
                font-size: .8rem;
                color: #aaa;
            }

            .stats {
                margin-top: 25px;
                text-align: center;
                padding-bottom: 20px;
                border-bottom: 1px solid #ededed;
                font-family: 'Montserrat', sans-serif;
            }


            .number-stat {
                padding: 0px;
                font-size: 1rem;
                font-weight: bold;
                font-family: 'Montserrat', sans-serif;
                color: #aaa;
            }

            .desc-stat {
                margin-top: -15px;
                font-size: 10pt;
                color: #bbb;
            }

            .desc {
                text-align: center;
                margin-top: 25px;
                margin: 25px 40px;
                color: #999;
                font-size: 11pt;
                font-family: 'Montserrat', sans-serif;
                padding-bottom: 25px;
                border-bottom: 1px solid #ededed;
            }

            .social {
                margin: 5px 0 12px 0;
                text-align: center;
                display: inline-block;
                font-size: 20pt;
            }

            .social i {
                cursor: pointer;
                margin: 0 15px;
            }

            .social i:nth-child(1) {
                color: #4267b2;
            }

            .social i:nth-child(2) {
                color: #1da1f2;
            }

            .social i:nth-child(3) {
                color: #bd081c;
            }

            .social i:nth-child(4) {
                color: #36465d;
            }

            .right {
                padding: 0 25px 0 25px !important;
            }

            .nav {
                display: inline-flex;
            }

            .nav li {
                margin: 40px 30px 0 10px;
                cursor: pointer;
                font-size: 13pt;
                text-transform: uppercase;
                font-family: 'Montserrat', sans-serif;
                font-weight: 500;
                color: #888;
            }

            .nav li:hover,
            .nav li:nth-child(1) {
                color: #999;
                border-bottom: 2px solid #999;
            }

            .follow {
                position: absolute;
                right: 8%;
                top: 35px;
                font-size: 11pt;
                background-color: #42b1fa;
                color: #fff;
                padding: 8px 15px;
                cursor: pointer;
                transition: all .4s;
                font-family: 'Montserrat', sans-serif;
                font-weight: 400;
            }

            .follow:hover {
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2), 0 0 15px rgba(0, 0, 0, 0.2);
            }

            @media (max-width:990px) {
                .nav {
                    display: none;
                }

                .follow {
                    width: 50%;
                    margin-left: 25%;
                    display: block;
                    position: unset;
                    text-align: center;
                }
            }

            .gallery {
                margin-top: 35px;
            }

            .gallery div {
                margin-bottom: 30px;
            }

            .gallery img {
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.10), 0 3px 6px rgba(0, 0, 0, 0.10);
                width: auto;
                height: auto;
                cursor: pointer;
                max-width: 100%;
            }

            /* View all */
            .view {
                position: absolute;
                right: 0;
                height: 35px;
                width: 70px;
                border-radius: 8px;
                background-color: #ff7900;
                color: white;
                font-size: 13px;
                border: none;
                cursor: pointer;
                top: 2.5rem;
                padding-top: 0.5rem;
                padding-left: 0.7rem;

            }

        </style>

    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            int user_id = 0;

            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {

        %>
        <%@include file="navbar.jsp" %>
        <!-- Admin profile -->

        <div class="container ">
            <header>
                <i class="fa fa-bars" aria-hidden="true"></i>
            </header>
            <main>
                <div class="row ">
                    <div class="left col-lg-4">
                        <div class="photo-left">
                            <img class="photo" src="./profileimg/<%=user.getProfileimg()%>" />


                        </div>
                        <div class="edit-pf ms-5">
                            <i class="bi bi-pencil-square" data-bs-toggle="modal"
                               data-bs-target="#exampleModaleditpf" style="margin-left: 0;"></i>

                        </div>

                        <!-- -----------
                        Modal
                        ------------->

                        <div class="modal fade" id="exampleModaleditpf" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Choose File</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ProfileImgChangeServlet" method="post" enctype="multipart/form-data" >
                                            <input id="fileInput" name="updateprofimg" type="file" />

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                        <input type="submit" value=" Save Changes" class="btn btn-primary" />
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <h4 class="name"><%= user.getUser_name()%></h4>
                        <!-- <p class="info">UI/UX Designer</p> -->
                        <p class="info"><%=user.getEmail()%></p>


                        <div class="stats row ">
                            <div class="stat col-xs-4" style="padding-right: 50px;">
                                <p class="number-stat"><%

                                    try {
                                        Connection con = ConnectionProvider.getConnection();
                                        String like = "select count(likes) from post_likesdislikes where user_id='" + user.getUser_id() + "'";
                                        Statement st2 = con.createStatement();
                                        ResultSet rs3 = st2.executeQuery(like);
                                        rs3.next();
                                        out.println(rs3.getInt(1));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                    %>
                                </p>
                                <p class="desc-stat">Likes</p>
                            </div>
                            <div class="stat col-xs-4">
                                <p class="number-stat">
                                    <%
                                        try {
                                            Connection con = ConnectionProvider.getConnection();
                                            String like = "select count(user_id) from post_comments where user_id='" + user.getUser_id() + "'";
                                            Statement st2 = con.createStatement();
                                            ResultSet rs3 = st2.executeQuery(like);
                                            rs3.next();
                                            out.println(rs3.getInt(1));
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </p>
                                <p class="desc-stat">Comments</p>
                            </div>
                            <div class="stat col-xs-4" style="padding-left: 50px;">
                                <p class="number-stat post-count"> <%
                                    try {
                                        Connection con = ConnectionProvider.getConnection();
                                        String like = "select count(user_id) from user_post where user_id='" + user.getUser_id() + "'";
                                        Statement st2 = con.createStatement();
                                        ResultSet rs3 = st2.executeQuery(like);
                                        rs3.next();
                                        out.println(rs3.getInt(1));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                    %></p>
                                <p class="desc-stat">Uploads</p>
                            </div>

                        </div>
                        <!--<form action="UserLogoutServlet" method="post">-->
                        <button type="submit" class="btn logout btn-default btn-sm"
                                style="color: #c71d0a;height: 3rem; width: 6.4rem;">
                            Log-out<i class="bi bi-box-arrow-right ms-2"></i>
                        </button>
                        <!--</form>-->
                    </div>
                    <div class="right col-lg-8" style="position: relative;">
                        <ul class="nav">
                            <li>Posts</li>
                            <!-- <li>Collections</li>
                    <li>Groups</li>
                    <li>About</li> -->
                        </ul>
                        <form class="view" action="viewall.jsp" method="post">
                            <input type="hidden" name="user_id" value="<%= user.getUser_id()%>"/>
                            <button type="submit" style="background: transparent; border: none" >View All</button>
                        </form>
                        <!-- <span class="follow">Follow</span> -->

                        <div class="container-fluid">
                            <div class="row gallery">
                                <%

                                    Connection con = ConnectionProvider.getConnection();
                                    try {
                                        String q1 = null;
                                        int i = 0;
                                        q1 = "select *from user_post where user_id='" + user.getUser_id() + "'";

                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery(q1);
                                        if (rs.next()) {
                                            rs = st.executeQuery(q1);
                                            while (rs.next()) {
                                                user_id = rs.getInt("user_id");
                                                String desc = rs.getString("description");
                                                if (desc.length() > 80) {
                                                    desc = desc.substring(0, 70);

                                                }
                                                i++;
                                                if (i == 3) {
                                                    break;
                                                }

                                %>
                                <div class="col-md-6 img-fluid">
                                    <div class="card" style="position: relative; height: 20rem; width: 13rem;">
                                        <div class="card__header">
                                            <img style="height: 8rem; width: 13rem; object-fit:contain;" src="./User_Post/<%=rs.getString("post_img")%>" alt="card__image"
                                                 class="card__image" width="600"  />
                                        </div>
                                        <div class="card__body" style="margin-top:-2rem;">
                                            <span class="tag tag-blue"><%=rs.getString("category")%></span>
                                            <h4 style="font-size: 1rem; font-weight: 500;"><%=rs.getString("title")%></h4>
                                            <p>
                                                <%=rs.getString("description")%>
                                            </p>
                                            <!--<button class="button-34" role="button">Read more..</button>-->
                                        </div>


                                        <div style="position: absolute; bottom: -2.3rem; left: -2.9rem;" class="date-time">
                                            <p><%= rs.getString("datetime")%></p>
                                        </div>

                                        <input type="hidden" value="<%= rs.getString("post_id")%>"/>

                                        <div class="DELETE-POST" style=" position: absolute; right: 0;top: 8.5rem;color: red;cursor: pointer;">
                                            <i class="bi bi-trash3 delete"></i>
                                        </div>
                                    </div>
                                </div><%}
                                } else {

                                %>
                                <img src="./empty msg/20240308_140855.jpg" class="img-fluid first_post" alt="alt" style="height: 20rem;"/>

                                <%                                        }
                                    } catch (Exception e) {
                                    }
                                %>

                            </div>
                        </div>

                    </div>
            </main>
        </div>
        <%
            }
        %>

        <script src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
    </body>
</html>
<script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
<script>
    let userid =<%=user.getUser_id()%>
//    ----------------
//    Post Count
//    ----------------
    $.ajax({
        url: "UserPostCountProfilePage",
        data: {"uid": userid},
        success: function (data) {
            $(".post-count").text(data);
        }


    });
    $(".DELETE-POST").click(function () {
        if (confirm("Are you sure to remove this news?"))
        {

            let pid = $(this).siblings();
            let id = $(pid[3]).attr("value");
            console.log(id);

            $.ajax({
                url: "UserDeletePostServlet",
                data: {"pid": id},
                success: function (data) {
                    window.location.href = "userProfile.jsp"

                    console.log(data);
                    $.ajax({
                        url: "UserPostCountProfilePage",
                        data: {"uid": userid},
                        success: function (data) {
                            $(".post-count").text(data);
                        }


                    });

                }

            });
        }
    });

//    LOGOUT MSG USER
    $(".logout").click(function () {
        if (confirm("sure to logout..."))
        {
            window.location.href = "logout.jsp";
        }
    });
$(".first_post").click(function () {
    window.location.href="post.jsp";
    });




</script>
