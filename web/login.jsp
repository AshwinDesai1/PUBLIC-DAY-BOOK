
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
                        <div class="title">Login here</div>
                        <%
                            String str = (String) session.getAttribute("uem_match");
                            if (str != null) {
                        %>
                        <P class="alert alert-warning captch-err d-flex align-items-center"
                           role="alert" 
                           style="
                           height: 1.2rem;
                           margin-top: 1rem;">You are not able to login.</P>
                            <%}
                                session.setAttribute("uem_match", null);
                            %>
                        <div class="content">
                            <form action="UserLoginServlet" onsubmit="return match()" method="post" class="pb-4" id="reg-form" onsubmit="return validation()">
                                <div class="user-details">
                                </div>
                                <div class="input-box">
                                    <span class="details">Email</span>
                                    <input type="text" class="mb-2" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Enter valid email" placeholder="Enter username"
                                           required />
                                </div>
                                <div class="input-box">
                                    <span class="details">password</span>
                                    <input type="password" id="password" class="mb-2" name="password" placeholder="Enter password"
                                           required />
                                </div>
                                <div class="input-box">
                                    <span class="details">Captcha</span>
                                    <input class="inputcaptcha" type="text" name="inpucaptcha" onpaste="return false" placeholder="Enter Captcha" required/>
                                </div>
                                <div class="input-box">
                                    <input type="text" class="input_captcha orgcaptcha" oncopy="return false" name="orgcapttcha"  value="a3fD3e" 
                                           style="outline: none;
                                           font-size: 1.3rem;
                                           border: none;
                                           text-decoration: line-through;
                                           font-family: cursiven"/>
                                    <i class="bi bi-arrow-clockwise ref-icon" 
                                       style="margin-left: 6.5rem;
                                       font-size: 1.1rem;
                                       position: relative;
                                       top: -2rem"></i>
                                </div>

                                <%
                                    if (loginerr != null) {
                                %>
                                <div class="alert alert-warning d-flex align-items-center"
                                     role="alert" style="height:1.5rem;
                                     margin-top: -1rem;">Your detail not match..
                                </div>

                                <%
                                    }
                                    session.removeAttribute("error");
                                %>  
                                <P class="alert alert-warning captch-err d-flex align-items-center"
                                   role="alert" 
                                   style="display: none!important;
                                   height: 1.2rem;
                                   margin-top: -1rem;">Wrong captcha..</P>
                                <div class="button login-submit d-flex" style=" padding-top: 1.3rem;
                                     display: flex;
                                     flex-direction: column; "><input
                                        type="submit" value="Login">       
                                </div>
                                <div class="not-acc"> 
                                    <center><h6> Not a account.?</h6></center>
                                    <center> <a class="link" href="registration.jsp">create new account</a></center>
                                    <center> <a class="link" href="forgot_password.jsp">forgot password</a></center>

                                </div>
                                <p class="a"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
            <script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
            <script>
//                           $(".errrr").css("display","none");
                                $(".ref-icon").click(function () {
                                    storecaptcha();

                                });
                                function generateCaptcha(min, max) {
                                    let captchagenerate = Math.floor(Math.random() * (max - min) + min);
                                    return captchagenerate;
                                }
                                function storecaptcha() {
                                    let value = String.fromCharCode((generateCaptcha(65, 90)));
                                    value += String.fromCharCode(generateCaptcha(97, 122));
                                    value += generateCaptcha(48, 57);
                                    value += generateCaptcha(48, 57);
                                    value += String.fromCharCode(generateCaptcha(65, 90));

                                    $(".input_captcha").val(value);
                                }
                                storecaptcha();
                                function match() {

                                    let orgcapcha = $(".orgcaptcha").val();
                                    let inputcaptcha = $(".inputcaptcha").val();
                                    console.log(orgcapcha);
                                    console.log(inputcaptcha);
                                    if (orgcapcha == inputcaptcha)
                                    {
                                        return true;
                                    } else
                                    {
                                        $(".captch-err").css("display", "block");
                                        return false;

                                    }
                                }
                                $(".login-submit").click(function () {
                                    match()
                                });
                                $(".input_captcha").on("copy", function ()
                                {
                                    alert("You are not able to copy value here");

                                });

                                $(".inputcaptcha").on("paste", function ()
                                {
                                    alert("You are not able to paste value here");

                                });


            </script>
        </body>
    </html>
