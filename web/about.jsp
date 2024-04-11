
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include  file="./Re-use_Pages/All_links.jsp" %>
        <link rel="stylesheet" href="./All_Css/home.css">
        <link rel="stylesheet" href="./All_Css/bootstrap.min.css">
        <link rel="stylesheet" href="./font/bootstrap-icons.min.css">

        <style>
            html{
                overflow-x:hidden;
            }
            .footer{
                background:linear-gradient(0deg,rgb(132 144 255) 0%, rgb(98 189 252) 100%);
                color:whitesmoke;
            }
            a{
                color:whitesmoke;

            }
            .error-msg
            {
                color: red;
                font-weight: 500;
                opacity: 70%;
                display: none;

            }
        </style>

    </head>
    <body>
        <%@include  file="navbar.jsp" %>      <!-- hero section or Main section or home main section  -->
       <% User us = (User) session.getAttribute("user");%>
       <input type="hidden" value="<% if(us!=null){ out.println(us.getUser_id());} %>" class="uid_login"/>
        <div class="container-fluid hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-11 col-md-6 hero-detail">
                        <h1><span style="color:#ff7900"</span>Public Day Book</h1>
                        <p>We are try to give you best and most ranked college to your bright feature threw this website..if you like us website plz give your feedBack</p>
                    </div>
                    <div class="col-11 col-md-6">
                        <div>
                            <img src="WebsiteImages/vecteezy_a-couple-is-doing-a-social-media-marketing-strategy_9160035.jpg" alt="LOGO" class="img-fluid"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--                 Second part of about/contact form -->



        <div class="container-fluid hero-section">
            <div class="container">
                <div class="row align-items-center">

                    <div class="col-11 col-md-5 me-5 order-sm-1 order-md-0">
                        <div>
                            <img src="WebsiteImages/report.jpg" alt="heroimage" class="img-fluid"/>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 hero-detail " id="contact">
                        <div class="row mt-2">
                            <div class="h4-title h4-title-login my-2">
                                <h4>Report</h4>

                            </div>
                        </div>

                        <div class="row mb-5">
                            <div class="col-11 col-md-11">
                                <!--<form action="UserContactServlet" method="post" id="myabout">-->
                                    <div class="mb-1">
                                        <label for="pname" class="form-label">Fill your report</label>
                                        <textarea class="form-control query" placeholder="fill your report" id="query" style="box-shadow: none" id="query"   name="query" required></textarea>
                                        <div class="errer_div error_div1" style="color: red; display: none">
                                            report grater than minimus 5 character
                                        </div>
                                    </div>
                                    <button type="submit"  class="btn  sub-report btn1" style="background-color: #ff7900;color: white">Report</button>
<!--                                </form>-->
                            </div>

                        </div>
                    </div>
                </div>


            </div>
        </div>
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
 <script src="./Javascript_Files/jquery.js"></script>
<script>
    $(".sub-report").on("click",function()
    {
       let user=$(".uid_login").attr("value");
       if(user!="")
       {
           let value= $("#query").val();
           console.log(value)
           if(value.length>5)
           {
           $.ajax({
               url:"UserContactServlet",
               data:{"query":value},
               success:function(data)
               {
                  console.log(data); 
                  alert("Report Submited..")
                  window.location.href="./about.jsp";
               }
           });
       }else{
           $(".error_div1").css("display","block");
       }
       }
       else
       {
           window.location.href="./login.jsp";
       }
    });
   
   
</script>


</body>
</html>
