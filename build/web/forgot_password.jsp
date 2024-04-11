
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include  file="./Re-use_Pages/All_links.jsp" %>
        <link rel="stylesheet" href="./All_Css/home.css">
        <link rel="stylesheet" href="./All_Css/bootstrap.min.css">
        <link rel="stylesheet" href="./font/bootstrap-icons.min.css">

        <title>JSP Page</title>
        <style>
            /* r */
            html,body{
                overflow-x: hidden;
                background: white;
            }

            .container {
                max-width: 700px;
                width: 60%;
                height: 90%;
                background-color: #fff;
                padding: 20px 20px;
                box-shadow: 0 1px 3px #000;
                /*box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);*/
            }

            .container .title {
                font-size: 24px;
                font-weight: 500;
                position: relative;
            }

            .container .title::before {
                content: "";
                position: absolute;
                left: 0;
                bottom: 0;
                height: 2px;
                width: 1.5rem;
                background:#ff7900;
            }

            .details {
                font-size: 1rem;
            }

            .content form .user-details {
                display: flex;

                margin: 10px 0 12px 0;
            }

            /*            form .user-details .input-box {
                            margin-bottom: 10px;
                            width: calc(100% / 2 - 20px);
                        }*/

            form .input-box span.details {
                display: block;
                /*font-weight: 200;*/
                margin-bottom: 10px;
            }

            .input-box input {
                height: 38px;
                width: 100%;
                outline: none;
                font-size: 15px;
                border-radius: 3px;
                padding-left: 10px;
                border: 1px solid #ccc;
                /*border-bottom-width: 1px;*/
                transition: all 0.3s ease;
            }

            form .button {
                height: 48px;
                margin: 35px 0;
                margin-top: -1.9rem;
            }

            form .button input {
                height: 100%;
                width: 100%;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 16px;
                font-weight: 400;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: #ff7900;
            }

            form .button input:hover {
                /* transform: scale(0.99); */
                background:#ff7900;
            }

            .errer_div {
                font-size: 0.8rem;
            }
            .link{
                text-decoration: none;
            }
            .not-acc{
                margin-top: -1rem;
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

                form .category {
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
                    height: 34px;
                }

                .details {
                    font-size: 0.8rem;
                }

                .container .title::before {
                    height: 2px;
                    width: 6rem;
                }

                form .button {
                    height: 29px;
                }

                form .button input {
                    height: 80%;
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


            </style>

        </head>
        <body>
            <%

                String loginerr = (String) session.getAttribute("error");
                System.out.println("loginerr" + loginerr);
            %>
            <div class="row d-flex justify-content-center" style="background-color: white;">
                <%@include  file="navbar.jsp" %>

                <div class="col-md-6 s" style="margin-top: 1rem;">
                    <div class="container">
                        <div class="title">confirm detail</div>
                        <div class="content">
                            <form action="forgopasswordServlet" onsubmit="return match()" method="post" class="pb-4" id="reg-form" onsubmit="return validation()">
                                <div class="user-details">
                                </div>
                                <div class="input-box">
                                    <span class="details">Email</span>
                                    <input type="text" class="mb-2" id="email" name="email" placeholder="Enter username"
                                           required />
                                </div>
                                <div class="input-box">
                                    <span class="details">enter your friend name</span>
                                    <input type="text" id="friend" class="mb-2" name="friend" placeholder="Enter password"
                                           required />
                                </div>
                                <div class="input-box">
                                    <span class="details">new password</span>
                                    <input type="password" id="password" class="mb-2" name="newpassword" placeholder="Enter password"
                                           required />
                                </div>



                                <div class="button login-submit d-flex mt-2" style=" padding-top: 1.3rem;
                                     display: flex;
                                     flex-direction: column; "><input
                                        type="submit" value="change password">       
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
            <script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
            <script>
//                     



            </script>
        </body>
    </html>
