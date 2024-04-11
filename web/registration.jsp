
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>registration</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include  file="./Re-use_Pages/All_links.jsp"%>
  <!--<link rel="stylesheet" href="./style.css">-->
  <link rel="stylesheet" href="All_Css/home.css">
  <!-- ------------------------
    Bootstrap css link 
    ----------------------- -->
    <link rel="stylesheet" href="./All_Css/bootstrap.min.css">
  <link rel="stylesheet" href="./font/bootstrap-icons.min.css">

   <style>
    /* r */
     html,body{
            overflow-x: hidden;
        }
    
    .container {
      max-width: 700px;
      width: 80%;
      height: 90%;
      background-color:#fff;
      padding: 25px 30px;
      box-shadow: 0 1px 3px #000;
    }

    .container .title {
      font-size: 25px;
      font-weight: 500;
      position: relative;
    }

    .container .title::before {
      content: "";
      position: absolute;
      left: 0;
      bottom: 0;
      height: 2px;
      width: 2rem;
      border-radius: 5px;
      background: #ff7900;
    }

    .details {
      font-size: 0.8rem;
    }

    .content form .user-details {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin: 20px 0 12px 0;
    }

    form .user-details .input-box {
      margin-bottom: 15px;
      width: calc(100% / 2 - 20px);
    }

    form .input-box span.details {
      display: block;
      font-weight: 500;
      margin-bottom: 5px;
    }

    .user-details .input-box input {
      height: 38px;
      width: 100%;
      outline: none;
      font-size: 13px;
      border-radius: 5px;
      padding-left: 15px;
      border: 1px solid #ccc;
      border-bottom-width: 1px;
      transition: all 0.3s ease;
    }

    .gender-details {
      margin-top: -1.3rem;
    }

    .user-details .input-box input:focus,
    .user-details .input-box input:valid {
      border-color: #71b7e6;
    }

    form .gender-details .gender-title {
      font-size: 14px;
      font-weight: 500;

    }

    form .category {
      display: flex;
      width: 80%;
      margin: 14px 0;
      justify-content: space-between;
      font-size: 14px;
    }

    form .category label {
      display: flex;
      align-items: center;
      cursor: pointer;
    }

    form .category label .dot {
      height: 15px;
      width: 15px;
      border-radius: 50%;
      margin-right: 10px;
      background: #d9d9d9;
      border: 5px solid transparent;
      transition: all 0.3s ease;
    }

    #dot-1:checked~.category label .one,
    #dot-2:checked~.category label .two,
    #dot-3:checked~.category label .three {
      background: #ff7900;
      border-color: #d9d9d9;
    }

    form input[type="radio"] {
      display: none;
    }

    form .button {
      height: 42px;
      margin: 35px 0;
      margin-top: -0.3rem;
    }

    form .button input {
      height: 100%;
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

    @media (max-width: 584px) {
      .container {
        max-width: 100%;
      }
      form .category {
      font-size: 13px;
    }
      form .gender-details .gender-title {
      font-size: 12px;
      }
      form .category label .dot {
      height: 13px;
      width: 13px;
      }
      .user-details .input-box input{
        font-size: 10px;
      }
      form .user-details .input-box {
        margin-bottom: 15px;
        width: 100%;
      }

      form .category {
        width: 100%;
      }

      .content form .user-details {
        max-height: 300px;
        overflow-y: scroll;
      }

      .user-details::-webkit-scrollbar {
        width: 5px;
      }
    }

    @media (max-width: 459px) {
      .container .content .category {
        flex-direction: column;
      }
    }

    /* ------------
admin profile
  --------- */
    .profile img {
      border-radius: 50%;
      width: 5rem;
      height: 5rem;
      object-fit: cover;
    }

    .profile p {
      font-family: "Nunito", sans-serif;
      padding-bottom: 0.5rem;
    }

    .profile h5 {
      font-size: 1rem;
      color: #005E9B;
      font-family: "Nunito", sans-serif;
      /* align-self: center; */
    }

    .table-div {
      /* border: 1px solid black; */
      /* border-radius: 0.2rem; */
      padding-bottom: 0.5rem !important;
      overflow: hidden !important;
     
    }

    .table-div h5 {
      font-size: 0.9rem;
      font-family: "Nunito", sans-serif;
      color: #005E9B;
    }

    .table td {
      font-size: 0.8rem;
      font-family: "Quicksand", sans-serif;
      font-weight: 700;
    }

    .edit-btn {
      font-size: 0.8rem;
      padding: 0.3rem 1rem;

    }

    @media(max-width:375px) {
      .table tr td {
        font-size: 0.6rem;
      }

      .table input {
        width: 4rem;
      }

      .table textarea {
        width: 4rem;
      }

    }
  </style>
    </head>
   <body>
       
     
       <%@include  file="navbar.jsp"%>
  <div class="row d-flex justify-content-center" style="background-color: white;">
    <div class="col-md-6 mt-2">
      <div class="container">
        <div class="title">Regisrtation</div>
        <%
          String str =(String)session.getAttribute("uem_match");
          if(str!=null)
          {
          %>
           <P class="alert alert-warning captch-err d-flex align-items-center"
                           role="alert" 
                           style="
                           height: 1.2rem;
                           margin-top: 1rem;"><%= str %></P>
        <%
          }
        session.setAttribute("uem_match",null);
         %>
        <div class="content">
            <form action="RegistrationServlet" class="pb-4" id="reg-form" onsubmit="return validation()"method="post">
            <div class="user-details">
              <div class="input-box">
                <span class="details">Full Name</span>
                <input type="text" id="fullname" name="fname" placeholder="Full Name" required />
                <div class="please enter minimus 5 character"></div>
                <div class="errer_div error_div1" style="color: red; display: none">
                  Enter minimus 5 character
                </div>
              </div>
              <div class="input-box">
                <span class="details">Username</span>
                <input type="text" id="username" name="uname" pattern="[a-zA-Z0-9\s]+" title="Do not use special character" placeholder="Username" required />
              </div>
              <div class="input-box">
                <span class="details">City/Town</span>
                <input type="text" id="city" name="city" placeholder="City or Town" required />
              </div>
              <div class="input-box">
                <span class="details">Address</span>
                <input type="text" name="address" placeholder="Address" required />
              </div>
              <div class="input-box">
                <span class="details">Email</span>
                <input type="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Enter valid email" placeholder="Email" required />
              </div>
              <div class="input-box">
                <span class="details">Mobile Number</span>
                <input id="mobileno" pattern="[0-9]{10}" type="number"  name="mnumber" placeholder="Mobile" required />
                <div class="errer_div error_div_mo" style="color: red; display: none">
                  Enter 10 digit no
                </div>
              </div>
              <div class="input-box">
                <span class="details">Password</span>
                <input id="password" type="password" name="password" pattern=".{6,}" title="Enter more than 5 character." placeholder="Password" required />
              </div>
              <div class="input-box">
                <span class="details">Confirm Password</span>
                <input type="password" id="confpassword" placeholder="Confirm password" required />
                <div class="errer_div error_div_confpw" style="color: red; display: none">
                  Password don't match.
                </div>
              </div> 
            </div>
                 <div class="input-box">
                <span class="details">Close fried name(*Rember for forgate password)</span>
                <input id="forgate-pw" class="form-control" type="text" name="friends" placeholder="Enter your friend name" required />
              </div>
            <div class="gender-details mt-2">
              <input type="radio" name="gender" value="male" id="dot-1" checked />
              <input type="radio" name="gender" value="female" id="dot-2" />
              <input type="radio" name="gender" value="Prefer not to say" id="dot-3" />
              <span class="gender-title">Gender</span>
              <div class="category">
                <label for="dot-1">
                  <span class="dot one"></span>
                  <span class="gender">Male</span>
                </label>
                <label for="dot-2">
                  <span class="dot two"></span>
                  <span class="gender">Female</span>
                </label>
                <label for="dot-3">
                  <span class="dot three"></span>
                  <span class="gender">Prefer not to say</span>
                </label>
              </div>
            </div>
            <div class="button d-flex " style="display: flex; flex-direction: column; ">
              <input type="submit" value="Register"> 
               <a style="text-align: center; padding-top: 5px;" href="login.jsp">login here</a>
              </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- ------------------------
    Bootstrap js link 
    ----------------------- -->
    <script defer src="./Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
  
    <script src="./Javascript_Files/jquery.js" type="text/javascript"></script>
 
<script>
 //   fulname input
 $("#fullname").on("input",function(){
    let fname= $("#fullname").val();
    let error=$(".error_div1");
    if(fname.length<5)
    {
    error.css("display","block");
    }
    else
    {
      error.css("display","none");
    }
   });


// mobile input


$("#mobileno").on("input",function()
{
    let Mobino=$("#mobileno").val();
    let error=$(".error_div_mo");

    if(Mobino.length==10)
    {
        error.css("display","none");
    }
    else
    {
        error.css("display","block");
    }
}
);


//  passwod  input


$("#confpassword").on("input",function()
{
    var password=$("#password").val();
    var confpassword=$("#confpassword").val();
    if(confpassword==password)
    {
        $(".error_div_confpw").css("display","none");
    }
    else
    {
        $(".error_div_confpw").css("display","block");
    }
}
);

$("#reg-form").on("submit",validation);

function validation()
{
    var fname=$("#fullname").val();
    var Mobino=$("#mobileno").val();
    console.log(Mobino);
    var password=$("#password").val();
    var confpassword=$("#confpassword").val();
    if(fname.length>5 && Mobino.length==10 && confpassword==password)
    {
        return true;
    }
    else
    {
        return false;
    }
     if(fname.length>5 && Mobino.length==10 && confpassword==password )
    {
        return true;
    }
    else{
        return false;
    }
}

</script>
<script src="Javascript_Files/bootstrap.bundle.js" type="text/javascript"></script>
<script src="Javascript_Files/jquery.js" type="text/javascript"></script>
</body>
</html>
