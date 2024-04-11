<%-- 
    Document   : SearchNewsIndex
    Created on : 19-Feb-2024, 2:12:55 pm
    Author     : admin
--%>

<%@page import="helper.dboperation"%>
<%@page import="java.util.Vector"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="java.util.Iterator,java.sql.*"%>
<%@page import="entity.User"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid ajax-search">
    <div class="row">
        <%
            String searchval = request.getParameter("searchval");
            User us = (User) session.getAttribute("user");
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
//                    String category = (String) session.getAttribute("category");
            Connection con = ConnectionProvider.getConnection();
            try {
                String q1 = null;

 
                if (searchval != null) {
                    q1 = "select *from user_post where title like '%" + searchval + "' or title like'" + searchval + "%' or title like'%" + searchval + "%'";
                }  
                else {
                    q1 = "select *from user_post ";
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
        <div class="col-md-3 col-xl-3 col-sm-5 mb-4 our_card">
            <div class="card">
                <div class="card__header">
                    <img
                        src="User_Post/<%=rs.getString("post_img")%>"
                        alt="card__image"
                        class="card__image"
                        width="600"
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
                    <input type="hidden" name="clientprofview" value="<%=user_id%>" />
                    <div class="user u-pf">
                        <img class=""  src="profileimg/<%=user_profileimg%>" alt="" style="border-radius:50%; height: 2rem; width: 1.6rem;">
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
                    <input type="hidden" name="cpostid" class="abc" value="<%=rs.getInt("post_id")%>" />
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
        <h3>
            Not found any news.!
            <!--<img src="User_Post/news-nt-avlbl.png" class="img-fluid" alt="alt" style="height: 20rem;"/>-->
        </h3>
        <%
                }
            } catch (Exception e) {
            }
        %>


    </div>
</div>
