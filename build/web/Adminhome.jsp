<%-- 
    Document   : Adminhome
    Created on : 25-Jan-2024, 3:44:12 pm
    Author     : Admin
--%>

<%@page import="helper.ConnectionProvider"%>
<%@page import="helper.dboperation,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Re-use_Pages/All_links.jsp" %>

        <link href="All_Css/admin.css" rel="stylesheet" type="text/css"/>
        <link href="All_Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="font/bootstrap-icons.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .newc{
                font-size: 0.75rem!important;
                font-weight: 500;
                color: black!important;
            }
            .report-body {
                max-width: 1160px;
                overflow-x: auto;
                padding: 0.5rem;
            }
            td{
                font-size: 0.75rem;
                color: black
            }
            th{
                font-size: 0.75rem;
                font-family: sans-serif;
            }
            .searchuser1,.searchbtn1{
               display: none; 
            }
        </style>
    </head>
    <body> 
        <%
            String adminlogin = (String) session.getAttribute("adminlogin");
            if (adminlogin == null) {
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <!-- for header part -->
        <header> 

            <div class="logosec"> 
                <div class="logo"><img src="IMAGES/20240110_171800new.png" alt="" style="height: 2.5rem;"></div> 
                <i class="bi bi-list icn menuicn" id="menuicn" style="font-size: 1.5rem;"></i>

            </div> 

<!--            <div class="searchbar se"> 
                <input class="searchuser" type="text"
                       placeholder="Search User.."> 
                <div class="searchbtn"> 

                    <i class="bi bi-search"></i>
                </div> 
            </div> -->

            <!--            <div class="message"> 
            
                            <div class="dp"> 
                                <img src="IMAGES/ak.jpeg" alt="">
                            </div> 
                        </div> -->

        </header> 

        <div class="main-container"> 
            <div class="navcontainer"> 
                <nav class="nav"> 
                    <div class="nav-upper-options"> 
                        <div class="nav-option option1"> 
                            <i class="bi bi-border-style"></i>
                            <h3> Dashboard</h3> 
                        </div> 

                        <div class="option2 nav-option"> 
                            <i class="bi bi-people"></i> 
                            <h3> Users</h3> 
                        </div> 

                        <div class="nav-option option3"> 
                            <i class="bi bi-newspaper"></i>
                            <h3> News</h3> 
                            <input type="hidden" value="0"/>
                        </div> 

                        <div class="nav-option option4"> 
                            <i class="bi bi-trash"></i>
                            <h3> Removed news</h3> 
                        </div> 

                        <div class="nav-option option5"> 
                            <i class="bi bi-ban"></i>
                            <h3> Blocked</h3> 
                        </div>  
                        <div class="nav-option option6"> 
                            <i class="bi bi-eye"></i>
                            <h3> Reports</h3> 
                        </div>
                        <div class="nav-option logout"> 
                            <i class="bi bi-box-arrow-left"></i>        
                            <h3>Logout</h3> 
                        </div> 

                    </div> 
                </nav> 
            </div> 
            <div class="main"> 

                <div class="searchbar s2 d-flex "> 
                    <input type="text"
                           class="searchuser searchuser1"
                           name=""
                           id=""
                           placeholder="Search"> 
                    <div class="searchbtn searchbtn1"> 
                        <i class="bi bi-search"></i>
                    </div> 
                </div> 

                <div class="box-container mt-4"> 

                    <div class="box box1"> 
                        <div class="text"> 
                            <h2 class="topic-heading">
                                <%
                                    try {
                                        Connection con = ConnectionProvider.getConnection();
                                        String q = "select count(*) from user_reports";
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery(q);
                                        rs.next();
                                        out.println(rs.getInt(1));
                                    } catch (Exception e) {
                                    }
                                %>
                            </h2> 
                            <h2 class="topic">Reports</h2> 
                        </div> 

                        <i class="bi bi-eye"></i>
                    </div> 

                    <div class="box box2"> 
                        <div class="text"> 
                            <h2 class="topic-heading likes-count">150</h2> 
                            <h2 class="topic">Likes</h2> 
                        </div> 

                        <i class="bi bi-heart"></i>
                    </div> 

                    <div class="box box3"> 
                        <div class="text"> 
                            <h2 class="topic-heading comments-count">320</h2> 
                            <h2 class="topic">Comments</h2> 
                        </div> 

                        <i class="bi bi-chat-right-text"></i>
                    </div> 

                    <div class="box box4"> 
                        <div class="text"> 
                            <h2 class="topic-heading user-count">70</h2> 
                            <h2 class="topic">Users</h2> 
                        </div> 

                        <i class="bi bi-people"></i>
                    </div> 
                </div> 

                <div class="report-container"> 
                    <div class="ajax-post">
                        <div class="report-header"> 
                            <h1 class="recent-Articles">Recent users</h1> 
                             
                        </div> 

                        <div class="report-body" > 
                            <div class="row d-flex justify-content-center">
                                <div class=" col-md-11 all-detail">
                                    <table class="table table-hover admin-userdetails">



                                        <%
                                            try {

                                                Connection con = ConnectionProvider.getConnection();
                                                String q = "select *from u_registration where user_status='Active'";
                                                Statement st = con.createStatement();
                                                ResultSet rs = st.executeQuery(q);
                                                if (rs.next()) {
                                        %>
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
                                            rs = st.executeQuery(q);
                                            while (rs.next()) {
                                                int user_id = rs.getInt("user_id");


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
                                                    src="profileimg/<%= rs.getString("profileimg")%>"
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
                                        } else {
                                        %>
                                        <h3 class="mt-5" >Currently not available any users.</h3>
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
                </div>




            </div> 
        </div> 
    </div> 




    <script src="Javascript_Files/admin1.js"></script> 
    <script src="Javascript_Files/jquery.js" type="text/javascript"></script>
    <script>
//    =======================
//    Total User Count
//    =======================
        $.ajax({
            url: "TotalUserCountServlet",
            success: function (data) {
                $(".user-count").text(data);
            }
        });
//    =======================
//    Total Likes Count
//    =======================
        $.ajax({
            url: "TotalPostLikesCount",
            success: function (data) {
                $(".likes-count").text(data);
            }
        });

//    =======================
//    Total Comments Count
//    =======================
        $.ajax({
            url: "TotalCommentCount",
            success: function (data) {
                $(".comments-count").text(data);
            }
        });

        let op3 = $(".option3");
        let op2 = $(".option2");
        $(op2).css("background", "gray");

//        ---------------------  
//         See user post
//        ---------------------
        $(".see-post").click(function () {
            let item1 = $(this).parent().siblings();
            let id = $(item1[0]).text();
            console.log(id);
            $.ajax({
                url: "AdminUserPost.jsp",
                data: {"id": id},
                success: function (data) {
                    console.log(data);
                    $(".ajax-post").html(data);
                    $(".remove-post").click(function () {
                        if (confirm("Are you sure to remove?"))
                        {
                            let removeid = $($(this).parent().siblings()[0]).text();
                            console.log(removeid);
                            console.log("id......." + removeid);
                            $.ajax({
                                url: "Removepostfromadmin",
                                data: {"removeid": removeid},
                                success: function (data) {
                                    console.log(data);
                                    $.ajax({
                                        url: "AdminUserPost.jsp",
                                        data: {"id": id},
                                        success: function (data) {
                                            console.log(data);
                                            $(".ajax-post").html(data);
                                        }
                                    });
                                }
                            });
                        }
                    });
                }
            });
            $($(op2)).removeAttr("style");
            $(op3).css("background", "gray");
            let child = $(op3).children();
            let childval = $(child[2]).val();
            $(child[2]).removeAttr("value");
            $(child[2]).attr("value", "1")

            $(".searchbar").css("display", "none");
        });
        //Search user
        $(".searchuser").on("input", function () {
            let searchuser = $(this).val();
            console.log(searchuser)
            $.ajax({
                url: "Admincopyforusersearch.jsp",
                data: {"searchuser": searchuser},
                success: function (data) {
                    $(".report-body").html(data);
                }
            })

        })

        $(".option2").click(function () {
            window.location.href = "Adminhome.jsp"
            $(this).css('background', 'gray');
            let sibling = $(this).siblings();
            console.log(sibling[1]);
            $(sibling[1]).removeAttr("style");
            $(sibling[2]).removeAttr("style");
            $(sibling[3]).removeAttr("style");
        })
        $(".option3").click(function () {

            let sibling = $(this).siblings();
            console.log(sibling[1]);
            let child = $(this).children();
            let childval = $(child[2]).val()
            console.log(childval)
            if (childval == "0")
            {
                alert("Cilck on user then see its news.");
            }

        });
        $(".option4").click(function () {
            $(this).css('background', 'gray');
            let sibling = $(this).siblings();
            $(sibling[1]).removeAttr("style");
            $(sibling[2]).removeAttr("style");
            $(sibling[3]).removeAttr("style");
            $.ajax({
                url: "AdminRemovedPostData.jsp",
                data: {"id": 1},
                success: function (data) {
                    $(".ajax-post").html(data);
                }
            });
            $(".searchbar").css("display", "none");
        })
        $(".option5").click(function () {
            $(this).css('background', 'gray');
            let sibling = $(this).siblings();
            $(sibling[1]).removeAttr("style");
            $(sibling[2]).removeAttr("style");
            $(sibling[3]).removeAttr("style");
            $.ajax({
                url: "BlockedUserShow.jsp",
                data: {"id": 1},
                success: function (data) {
                    $(".ajax-post").html(data);
                }
            })
            $(".searchbar").css("display", "none");
        })

        $(".option6").click(function () {
            $(this).css('background', 'gray');
            $.ajax({
                url: "./AdminContactData.jsp",
                success: function (data) {
                    $(".ajax-post").html(data);
                }
            });
        });
//    =======================
//    Block User
//    =======================

        $(".block-btn").click(function () {
            if (confirm("Are you sure to block this user?"))
            {
                let userid = $(this).parent().siblings();
                let id = $(userid[0]).text();
                $.ajax({
                    url: "BlockUserAdminServlet",
                    data: {"uid": id},
                    success: function (data) {
                        console.log(data);
                    }
                });
                alert("Successfully Blocked..");
                window.location.href = "Adminhome.jsp";
            }
        });
//    =======================
//    Admin Log-Out
//    =======================
        $(".logout").click(function () {
            $.ajax({
                url: "AdminLogOut",
                success: function (data) {
                    window.location.href = "Adminhome.jsp";
                }
            });
        });
    </script>
</body> 
</html>
