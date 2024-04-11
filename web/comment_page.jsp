<%-- 
    Document   : comment_page
    Created on : 09-Feb-2024, 2:51:54 pm
    Author     : admin
--%>
<%@page import="helper.dboperation"%>
<%@page import="entity.User"%>
<%@page import="helper.ConnectionProvider,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("user");
    int userid = 0;
    if (user != null) {
        userid = user.getUser_id();
    }
%>
<div class="modal-body row ajax-comment"> 
    <%
        String cpid = request.getParameter("postid");
       
        Connection con = ConnectionProvider.getConnection();
        String q = "select * from post_comments  where post_id='" + cpid + "'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(q);
        while (rs.next()) {

            String q1 = "select * from u_registration where user_id='" + rs.getInt("user_id") + "'";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(q1);
            if (rs1.next()) {

    %>
    <div class="d-flex col-12" style="padding-top: 1rem">
        <img  src="./profileimg/<%=rs1.getString("profileimg")%>" alt="" style="border-radius:50%; height: 1.8rem; width: 1.8rem;">                                            
        <h5 style="font-size: 0.8rem;padding-top: 0.3rem">@<%=rs1.getString("username")%><br>
            <span style="padding-left: 0.7rem"><%=rs.getString("comment_message")%></span>
        </h5>
        <%

            int cid = rs.getInt("cid");
            dboperation db = new dboperation(ConnectionProvider.getConnection());
            int b = db.comment_delete_user(cid);
            if (userid != 0) {
                if (userid == b) {
        %>
        <input type="hidden" value="<%=cid%>">
        <i class="bi bi-trash3 delete-commnet-user " style="position: absolute;right: 0;font-size: 0.9rem;color: red;"></i>
        <%
            }
            }
        %>
    </div>
    <%
                
            }
        }%>
    <script src="Javascript_Files/jquery.js" type="text/javascript"></script>
    <script>
//        let delete1 = $(".delete-commnet-user");
//        for (let i = 0; i < delete1.length; i++)
//        {
//            $(".delete-commnet-user").click(function () {
//                let s = $(this).siblings();
//                let commentid = $(s[2]).attr("value");
//                console.log("commnet=" + commentid);
//                $.ajax({
//                    url: "deleteCommentServlet",
//                    data: {"commentid": commentid},
//                    success: function (data) {
//                        console.log(data);
//                    }
//                })
//
//            });
//        }


        $(".delete-commnet-user").click(function () {
            let s = $(this).siblings();
            let commentid = $(s[2]).attr("value");
            console.log("commnet=" + commentid);
            $.ajax({
                url: "deleteCommentServlet",
                data: {"commentid": commentid},
                success: function (data) {
                    console.log(data);
                }
            });
            window.location.href = "./index.jsp";
        });

//        

    </script>
</div>

