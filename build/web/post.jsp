<%-- 
    Document   : post1
    Created on : 04-Jan-2024, 3:58:18 pm
    Author     : admin
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="./Re-use_Pages/All_links.jsp" %>
        <title>post</title>
        <link href="./All_Css/home.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./All_Css/bootstrap.min.css">
        <style>
            /* r */
            html,body{
               overflow-x: hidden;
                height: 53rem;
            }
            .container {
                width: 58%;
                height: 31rem;
                background-color: #fff;
                padding: 10px 30px;
                box-shadow: 0 1px 3px black;
            }

            .form-control{
                box-shadow: none !important;
            }
            .container .title {
                font-size: 24px;
                font-weight: 500;
                position: relative;
                color: black;
            }

            .container .title::before {
                content: "";
                position: absolute;
                left: 0;
                bottom: 0;
                height: 2px;
                width: 1rem;
                /*border-radius: 5px;*/
                background:#ff7900;
            }

            .details {
                font-size: 1rem;
                color: black;
            }
            .content form .user-details {
                display: flex;
/*                flex-wrap: wrap;
                justify-content: space-between;*/
                margin: 1px 0 1px 0;
            }
            form .input-box span.details {
                display: block;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .input-box input {
                height: 33px;
                width: 100%;                   
                border-radius: 5px;
                padding-left: 15px; 
                transition: all 0.3s ease;
                font-size: 1rem;
            }
            form .button {
                height: 50px;
                margin: 35px 0;
                margin-top: -0.8rem;
            }

            form .button input {
                height: 90%;
                width: 100%;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 18px;
                font-weight: 400;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: #ff7900;
            }

            form .button input:hover {
                /* transform: scale(0.99); */
                background: #ff7900;
            }

            .errer_div {
                font-size: 0.8rem;
            }
            .link{
                text-decoration: none;
            }

            @media (max-width: 584px) {
                .container {
                    max-width: 100%;
                }

                .user-details .input-box input {
                    font-size: 10px;
                }

                form .user-details .input-box {
                    margin-bottom: 15px;
                    width: 100%;
                }



                /* .content form .user-details {
                    max-height: 300px;
                    overflow-y: scroll;
                } */

                /* .user-details::-webkit-scrollbar {
                    width: 5px;
                } */
            }

            @media (max-width: 459px) {
                .container .content .category {
                    flex-direction: column;
                }
            }

            @media(max-width:388px) {
                .container .title {
                    font-size: 21px;
                    font-weight: 500;
                }

                .input-box input {
                    height: 27px;
                }

                .details {
                    font-size: 0.7rem;
                }

                .container .title::before {
                    height: 2px;
                    width: 6rem;
                }

                form .button {
                    height: 25px;
                }

                form .button input {
                    height: 1.5rem;
                    font-size: 15px;
                }
                .link{
                    font-size: 0.6rem;
                }

            }



            @media(max-width:300px) {
                .container .title {
                    font-size: 17px;
                    font-weight: 400;
                }

                .details {
                    font-size: 0.7rem;
                }

                .input-box input {
                    height: 30px;
                    font-size: 10px;
                }

                .container .title::before {
                    height: 2px;
                    width: 4.8rem;
                }

                form .button input {
                    font-size: 14px;
                }
                .link{
                    font-size: 0.5rem;
                }

            }
        </style>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%
          User user=(User)session.getAttribute("user");
         
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>

        
        <div class="row d-flex justify-content-center" style="background-color: white;">
            <div class="col-md-6" style="margin-top: 1rem">
                <div class="container">
                    <div class="title">Post</div>
                    <div class="content">
                        <form action="UserPostServlet" class="pb-4" id="reg-form" method="post" enctype="multipart/form-data">
                            <div class="user-details">
                            </div>
                            <div class="input-box">
                                <span class="details">Title</span>
                                <input type="text" class="form-control mb-2" id="title" name="title" 
                                       required />
                            </div>
                            <div class="input-box">
                                <span class="details">Description</span>
                                <textarea class="form-control mb-2" id="description" name="description" required></textarea>
                            </div>
                            <div class="input-box">
                                <span class="details">category</span>
                                <select name="category" class="form-control mb-2 ">
                                    <option selected disabled value="select">--select--</option>  
                                    <option value="Technology">Technology</option>
                                    <option value="Sports">Sports</option> 
                                    <option value="Education">Education</option>
                                    <option value="Politics">Politics</option> 
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="input-box">
                                <div class="mb-3">
                                    <span class="details">image</span>
                                    <input type="file" id="city" class="form-control form-control-sm mb-2" name="postimg"
                                           required />
                                </div>
                            </div>
                            <div class="button d-flex" style="padding-top: 1rem;">
                                <input type="submit" value="post">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%        }%>
        <script src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
    </body>
</html>
