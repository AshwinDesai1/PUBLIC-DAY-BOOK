<%-- 
    Document   : navbar
    Created on : 25-Jan-2024, 3:05:47 pm
    Author     : Admin
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
   <%
   User u=(User)session.getAttribute("user");
   %>

<nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background: #ffff;">
      <!-- <div class="container-fluid"> -->
      <a class="navbar-brand logo" href="#"
        ><img src="IMAGES/20240110_171800new.png" class="img-fluid" alt=""
      /></a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="collapse navbar-collapse ms-3 menu-item"
        id="navbarSupportedContent"
      >
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
          </li>
          <li class="nav-item ms-2">
              <a class="nav-link active" href="about.jsp">About</a>
          </li>
          <li class="nav-item ms-2">
              <a class="nav-link active" href="post.jsp">Post</a>
          </li>
          <li class="nav-item ms-2">
              <a class="nav-link active" href="./about.jsp#contact">Report</a>
          </li>
        </ul>
        <div class="d-flex">
         
              <%
              if(u==null){
              %>
             
            <a class="nav-link login" href="login.jsp"
              ><i class="bi bi-person-add" style="color: black;margin-right: 0.3rem;font-size: 1.5rem;"></i
            ></a>
            <%
              }
              else
               {%>
               <a class="abc" href="userProfile.jsp">
               <img class="img-fluid" style="height: 2.2rem;width: 2rem; object-fit: cover;border-radius: 50%"
             src="profileimg/<%=u.getProfileimg() %>"></a>
                   <%}%>
         
        </div>
      </div>
      <!-- </div> -->
    </nav>
