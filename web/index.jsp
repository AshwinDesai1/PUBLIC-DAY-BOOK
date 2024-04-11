

<%@page import="entity.User"%>
<%@page import="java.util.Vector"%>
<%@page import="helper.dboperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="./All_Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="./All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./font/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .modal-body textarea{
                padding-left: 10px;
                font-size: 0.9rem;
            }
            .modal-title{
                font-size: 0.9rem
            }
            .search-input{
                height: 32px;

            }
            .search .search-input{
                font-size: 1.1rem;
            }
            .search-icon{
                height: 30px;
                width: 30px;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="d-flex justify-content-center">
            <div class="search" >
                <input style="background: #ffffff;"
                       type="text"
                       class="search-input"
                       placeholder="search news..."
                       name=""
                       />
                <a href="#" class="search-icon">
                    <i class="bi bi-search"></i>
                </a>
            </div>
        </div>

        <div class="container-fluid ajax-search">
            <div class="row">
                <%
                    User us = (User) session.getAttribute("user");
                    int check = 0;
                    if (session.getAttribute("check") != null) {
                        check = (int) session.getAttribute("check");
                        session.setAttribute("check", null);
                    }

                    Iterator t = null;
                    int arr[] = null;

                    if (us != null) {
                        dboperation db = new dboperation(ConnectionProvider.getConnection());
                        Vector vc = db.shouserlikes(us.getUser_name());
                        t = vc.iterator();
                        arr = new int[vc.size()];
                        int x = 0;
                        while (t.hasNext()) {
                            arr[x] = (int) t.next();
                            x++;
                        }
                    }
                %>
                <%
                    String category = (String) session.getAttribute("category");

                    Connection con = ConnectionProvider.getConnection();
                    try {
                        String q1 = null;
                        if (category == null) {
                            q1 = "select *from user_post  order by post_id desc ";
                        } else if (category.equals("All")) {
                            q1 = "select *from user_post order by post_id desc ";
                        } else {
                            q1 = "select *from user_post where category='" + category + "'";

                        }
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(q1);
                        if (rs.next()) {
                            rs = st.executeQuery(q1);
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
                <input type="hidden" value="<%= check%>" class="check"/>
                <div class="col-md-3 col-xl-3 col-sm-5 mb-4 our_card">
                    <div class="card">
                        <div class="card__header">
                            <img
                                src="User_Post/<%=rs.getString("post_img")%>"
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
                                <button type="submit" class="button-34 fullpost" role="button">Read more..</button>
                            </form>
                        </div>

                        <div class="card__footer">
                             <input type="hidden" name="fullpost" value="<%=rs.getInt("user_id")%>" />
                            <div class="user">
                                <img src="profileimg/<%=user_profileimg%>" alt="" style="border-radius:50%; height: 2rem; width: 1.6rem;">
                                <div class="user__info">
                                    <h5 style="font-size: 0.8rem">@<%=user_name%></h5>
                                </div>
                            </div>
                        </div>
                        <div class="date-time">
                            <p><%= rs.getString("datetime")%></p>
                        </div>

                        <!--===========================================================================
                                          USER LIKE ICON CLICK AND PERFECT LIKE CODE
                        ===========================================================================-->
                        <div class="like-icon comm-icon" style="">    

                            <input type="hidden" class="uid" value="<%if (us != null) {
                                    out.println(us.getUser_id());
                                }%>">

                            <input type="hidden" value="<%=rs.getInt("post_id")%>">

                            <%
                                boolean t1 = false;
                                int id = rs.getInt("post_id");
                                if (us != null) {
                                    for (int i = 0; i < arr.length; i++) {
                                        if (arr[i] == id) {
                                            t1 = true;
                                            System.out.println("post liek=" + arr[i]);
                                        }
                                    }
                                    if (t1 == true) {
                            %>
                            <i class="bi bi-suit-heart-fill like-btn" style="font-size: 1.2rem; color: #ff7900" value="0"></i>
                            <%
                            } else {
                            %>
                            <i class="bi bi-suit-heart like-btn" style="font-size: 1.2rem; color: #ff7900" value="1"></i>
                            <%}
                            } else {
                            %>

                            <i class="bi bi-suit-heart like-btn" style="font-size: 1.2rem;color: #ff7900 " value="1"></i>
                            <%
                                }
                                if (us != null) {
                            %>
                            <input type="hidden" value="<%=us.getUser_name()%>">
                            <%
                            } else {
                            %>
                            <input type="hidden" value="null">
                            <%}%>

                            <p class="countike" style="position: absolute;top: 1.2rem;font-size: 0.8rem;left: 0.4rem">    
                                <%
                                    try {

                                        String like = "select sum(likes) from post_likesdislikes where post_id='" + rs.getString("post_id") + "'";
                                        Statement st2 = con.createStatement();
                                        ResultSet rs3 = st2.executeQuery(like);
                                        rs3.next();
                                        out.println(rs3.getInt(1));
                                    } catch (Exception e) {
                                    }
                                %>
                            </p>
                            <!--===========================================================================
                                              USER COMMENT BOX CLICK MODEL INSIDE CODE
                            ===========================================================================-->
                            <input type="hidden" name="cpostid" class="abc xyz" value="<%=rs.getInt("post_id")%>" />
                            <i class="bi bi-chat-left-text comment-icon" data-bs-toggle="modal" data-bs-target="#exampleModaleditpf"  style="position: absolute;top: 0.4rem;font-size: 1.1rem;left: -1.7rem"></i> 
                            <div class="modal fade" id="exampleModaleditpf" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" style="width:15rem;">
                                    <div class="modal-content" >
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Comment here</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body d-flex">
                                            <%
                                                if (us != null) {
                                            %>
                                            <input type="hidden" class="uname" value="<%=us.getUser_name()%>">
                                            <%
                                            } else {
                                            %>
                                            <input type="hidden" value="null">
                                            <%}%>
                                            <input type="hidden"  class="uid" value="<%if (us != null) {
                                                    out.println(us.getUser_id());
                                                }%>">
                                            <input type="hidden" name="cpostid" class="abc" value="<%=rs.getInt("post_id")%>" />
                                            <textarea id="comment" placeholder="commnet here..." name="comment" style="height: 1.8rem;width: 15rem" class="comment-input"/></textarea>
                                            <i class="bi bi-send-fill share-post" style="position: relative;left: -1.4rem;"></i>

                                        </div>
                                        <div class="modal-body row ajax-comment"> 

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                } else {
                %>
               
                <img src="empty msg/20240308_141756.jpg" class="img-fluid" alt="alt" style="height: 20rem;"/>
                
                <%
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
//*****************************user like code***************************** 
            let likeicon = $(".like-btn");
            let f = 0;
            for (let i = 0; i < likeicon.length; i++)
            {
                $(likeicon[i]).click(function () {
                    let likeid = $(this).siblings();
                    let value = $(this).attr("value");
                    let postid = $(likeid[1]).attr("value");
                    console.log("psot id=" + postid);
                    let newname = $(likeid[2]).attr("value")
                    console.log("new name=" + newname);
                    let likeuid = $(".uid").attr("value");
                    console.log("like uid=" + likeuid);
                    let countval = $(likeid[3]).text();
//                    console.log("likecount value=" + countval);


                    if (newname == "null")
                    {
                        window.location.href = "login.jsp";
                    }
                    if (newname != "null")
                    {
                        let f = 1;
                        if (value == 1)
                        {
                            console.log("if part");
                            $.ajax({
                                url: "LikeDisLike",
                                data: {"userid": likeuid, "postid": postid, "status": 1, "uname": newname},
                                success: function (data)
                                {
                                    console.log(data);
                                    $(likeid[3]).text(data);
                                }
                            });

                            let value = $(this).attr("value", "0");
                            $(this).attr("class", "bi bi-suit-heart-fill like-btn");
                            $(this).attr("style", "color:#ff7900")

                        } else
                        {

                            console.log("else part");
                            $.ajax({
                                url: "LikeDisLike",
                                data: {"userid": likeuid, "postid": postid, "status": 0, "uname": newname},
                                success: function (data)
                                {
                                    console.log(data);
                                    $(likeid[3]).text(data);
                                }
                            });
                            let value = $(this).attr("value", "1");
                            $(this).attr("class", "bi bi-suit-heart like-btn");
                        }
                    }
                });
            }
//***************************user comment code****************************
//**************************comment box click code*************************
            let sendicon = $(".comment-icon");
            let cpid;
            for (let i = 0; i < sendicon.length; i++)
            {
                $(sendicon[i]).click(function () {
                    let send = $(this).siblings();
                    console.log(send);
                    cpid = $(send[5]).attr("value");
                    console.log("cpid=" + cpid);
//                    window.location.href = "index.jsp";
                    $.ajax({
                        url: "comment_page.jsp",
                        data: {"postid": cpid},
                        success: function (data)
                        {
                            console.log(data);
                            $(".ajax-comment").html(data);
                            $(".delete-commnet-user").click(function () {
                                let s = $(this).siblings();
                                let commentid = $(s[2]).attr("value");
                                console.log("commnet=" + commentid);
                                $.ajax({
                                    url: "deleteCommentServlet",
                                    data: {"commentid": commentid},
                                    success: function (data) {
                                        window.location.href = "./index.jsp";
                                    }
                                });

                            });

                        }
                    });
                });
            }

//**********************share icon click code*****************************
            let comment = $(".share-post");
            for (let i = 0; i < comment.length; i++)
            {

                $(comment[i]).click(function () {
                    let commenes = $(this).siblings();
                    console.log(commenes);
                    let commentuid = $(commenes[1]).attr("value");
                    console.log("like uid=" + commentuid);
                    let usercomment = $(".comment-input").val();
                    console.log("usercommen=" + usercomment);
                    console.log("usercomment legth=" + usercomment.length);
                    let uname = $(commenes[0]).attr("value");
                    console.log("uname=" + uname);
                    console.log("cpid in icon click=" + cpid);

                    if (uname == "null")
                    {
                        window.location.href = "login.jsp";
                    } else
                    {
                        console.log("usercomment legth in=" + usercomment.length);
                        if (usercomment.length > 0)
                        {
                            $.ajax({
                                url: "userCommentServet",
                                data: {"userid": commentuid, "postid": cpid, "usercomment": usercomment},
                                success: function (data)
                                {
                                    console.log(data);
                                    $(".comment-input").val("");
                                    window.location.href = "index.jsp";

                                }
                            });
                        }
                    }
                });
            }

//comment and delete comment code

            $(document).ready(function ()
            {

                let check = $(".check").attr("value");

                if (check != 0)
                {

                    $(".abc").attr("value", check);
                    $(".comment-icon").click();

                }

            });
//            \\search code
            $(".search-input").on("input", function () {
                let searchuser = $(this).val();
                console.log(searchuser);
                $.ajax({
                    url: "SearchNewsIndex.jsp",
                    data: {"searchval": searchuser},
                    success: function (data) {
                        $(".ajax-search").html(data);
                        let card = $(".our_card");
                        console.log("card" + card.length);
                        if (card.length == 1)
                        {
                            $(card[0]).removeAttr("class");
                            $(card[0]).attr("class", "col-md-5 col-xl-6 col-sm-5 mb-4 our_card")

                        }
                    }
                })

            });
            
            //Cliet visit profile.
            
            $(".user").click(function(){
                let sib=$(this).siblings();
                let uid=$(sib[0]).attr("value");
                window.location.href="ClientVisitProfile.jsp?uid="+uid;
            })
        </script>
    </body>
</html>
