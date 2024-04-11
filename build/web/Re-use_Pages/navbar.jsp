<%-- 
    Document   : navbar
    Created on : 25-Jan-2024, 3:05:47 pm
    Author     : Admin
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User u=(User)session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background: #ffff;">
      <!-- <div class="container-fluid"> -->
      <a class="navbar-brand logo" href="#"
        >
          <img src="../IMAGES/20240110_171800new.png" class="img-fluid" alt=""
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
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item ms-2">
            <a class="nav-link active" href="#">About</a>
          </li>
          <li class="nav-item ms-2">
            <a class="nav-link active" href="#">post</a>
          </li>
          <li class="nav-item ms-2">
            <a class="nav-link active" href="#">Contact</a>
          </li>
        </ul>
        <div class="d-flex">
          <span class="loginback">
              <%
              if(u==null){
              %>
            <a class="nav-link login" href="#" style="color: black"
              >Login <i class="fa-solid fa-user" style="color: black"></i
            ></a>
            <%
                }else{
                        
        %>
        <a>
        <img style="height: 2.5rem; width: 2rem; border-radius: 50%;" class="img-fluid" src="../profileimg/<%=u.getProfileimg() %>"
        </a>
             <%}%>
          </span>
        </div>
      </div>
      <!-- </div> -->
    </nav>
