/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.sql.*;
import entity.*;
import java.util.Vector;

public class dboperation {

    Connection con;

    public dboperation(Connection con) {
        this.con = con;
    }
//   ------------------ 
//   User Registration
//   ------------------

    public String findExistUsername(String uname) {
        String matchUname = null;
        try {
            String q = "select username from u_registration where username='" + uname + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {
                matchUname = rs.getString("username");
            }
            return matchUname;
        } catch (Exception e) {
        }
        return matchUname;
    }

    public String findExistEmail(String email) {
        String matchEmail = null;
        try {
            String q = "select email from u_registration where email='" + email + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {
                matchEmail = rs.getString("email");
            }
            return matchEmail;
        } catch (Exception e) {
        }
        return matchEmail;
    }

    public String findExistMobile(String mobile) {
        String mathMobile = null;
        try {
            String q = "select mobileno from u_registration where mobileno='" + mobile + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {
                mathMobile = rs.getString("mobileno");
            }
            return mathMobile;
        } catch (Exception e) {
        }
        return mathMobile;
    }

    public void userRegistration(String full_name, String user_name, String city, String address, String email, String mobileno, String password, String gender, String friend) {
        try {

            String q = "insert into u_registration(fullname,username,city,address,email,mobileno,password,gender,friend) values('" + full_name + "','" + user_name + "','" + city + "','" + address + "','" + email + "','" + mobileno + "','" + password + "','" + gender + "','" + friend + "' )";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
        }
    }

    public User findUser(String email, String Password) {
        User u = new User();

        try {
            System.out.println("come in db login");
            String q = "select *from u_registration where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setString(1, email);
            pst.setString(2, Password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                u.setUser_id(rs.getInt("user_id"));
                u.setFull_name(rs.getString("fullname"));
                u.setUser_name(rs.getString("username"));
                u.setCity(rs.getString("city"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setMobileno(rs.getString("mobileno"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setProfileimg(rs.getString("profileimg"));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        u = null;
        return u;
    }

//        =============================================
//         user post 
//        =============================================
    public void userPost(int user_id, String title, String description, String category, String post_img) {
        try {
            String q = "insert into user_post(user_id,title,description,category,post_img)values('" + user_id + "','" + title + "','" + description + "','" + category + "','" + post_img + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//        =============================================
//         User Deleted post get img name. 
//        =============================================

    public String getDeletedPostImg(int post_id) {
        String post_img = null;

        try {

            String q = "select post_img from user_post where post_id='" + post_id + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {

                post_img = (rs.getString("post_img"));
                return post_img;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return post_img;
    }

//    =============================================
//    user delete post in profile page
//    =============================================
    public boolean userDeletePost(int postid) {
        boolean f = false;
        try {
            String q = "delete from user_post where post_id='" + postid + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//        =============================================
//         user profile img update
//        =============================================
    public boolean userProfileChange(int user_id, String new_imgname) {
        boolean f = false;
        try {
            String q = "update u_registration set profileimg='" + new_imgname + "' where user_id='" + user_id + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateUserProfileInfo(int user_id, String full_name, String user_name, String gender, String city, String address, String mobile) {
        boolean f = false;

        try {
            String q = "update u_registration set fullname='" + full_name + "', username='" + user_name + "', city='" + city + "', address='" + address + "', mobileno='" + mobile + "' where user_id='" + user_id + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//   ------------------ 
//   Admin Login
//   ------------------
    public boolean findAdmin(String adminname, String Password) {
//        User u = new User();
        boolean f = false;
        try {

            String q = "select *from admin_login where admin_name=? and admin_password=?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setString(1, adminname);
            pst.setString(2, Password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                f = true;
                return f;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//   ------------------ 
//   Admin delete post
//   ------------------
    public boolean adminDeletePost(int postid) {
        boolean f = false;
        try {
            String q = "delete from user_post where post_id='" + postid + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//        =============================================
//         Admin Deleted post get. 
//        =============================================
    public Post getDeletedPost(int post_id) {
        Post post = new Post();

        try {

            String q = "select *from user_post where post_id='" + post_id + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {

                post.setP_id(rs.getInt("post_id"));
                post.setPuser_id(rs.getInt("user_id"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCategory(rs.getString("category"));
                post.setPostimg_name(rs.getString("post_img"));
                return post;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        post = null;
        return post;
    }

//        =============================================
//         Admin Deleted post Store. 
//        =============================================
    public void adminDeletedPostStore(int user_id, int post_id, String title, String description, String category, String post_img) {
        try {
            String q = "insert into admin_deletedpost(dp_oldid,dp_user_id,dp_title,dp_description,dp_category,dp_postimg)values('" + post_id + "','" + user_id + "','" + title + "','" + description + "','" + category + "','" + post_img + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//        =============================================
//         Admin Block user get. 
//        =============================================

    public User BlockUserGet(int u_id) {
        User u = new User();

        try {
            System.out.println("come in db login");
            String q = "select *from u_registration where user_id='" + u_id + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            if (rs.next()) {
                u.setUser_id(rs.getInt("user_id"));
                u.setFull_name(rs.getString("fullname"));
                u.setUser_name(rs.getString("username"));
                u.setCity(rs.getString("city"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setMobileno(rs.getString("mobileno"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setProfileimg(rs.getString("profileimg"));
                u.setReg_datetime(rs.getString("reg_datetime"));
                u.setUser_status(rs.getString("user_status"));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        u = null;
        return u;
    }

//        =============================================
//         Admin Block user store. 
//        =============================================
    public boolean blockedUserStore(int user_id, String full_name, String user_name, String city, String address, String email, String mobileno, String password, String gender, String profileimg, String reg_datetime) {
        boolean f = false;
        try {

            String q = "insert into blockuser_admin(user_id,full_name,username,city,address,email,mobileno,password,gender,profileimg,reg_datetime) values('" + user_id + "','" + full_name + "','" + user_name + "','" + city + "','" + address + "','" + email + "','" + mobileno + "','" + password + "','" + gender + "','" + profileimg + "','" + reg_datetime + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
        }
        return f;
    }

//        =============================================
//         Admin Block user Update in registration table. 
//        =============================================
    public boolean blockUserUpdate(int user_id, String new_status) {
        boolean f = false;
        try {
            String q = "update u_registration set user_status='" + new_status + "' where user_id='" + user_id + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//   ---------------------------------
//   Admin delete All post block time
//   ---------------------------------
    public boolean adminDeleteAllPost(int user_id) {
        boolean f = false;
        try {
            String q = "delete from user_post where user_id='" + user_id + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
            f = true;
            return f;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//   ---------------------------------
//   Total User Counts
//   ---------------------------------
    public int totalUserCount() {
        int count = 0;
        try {
            String q = "select count(*) from u_registration";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            rs.next();
            count = rs.getInt(1);
            return count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

//   ---------------------------------
//   Total Likes Counts
//   ---------------------------------
    public int totalLikeCount() {
        int count = 0;
        try {
            String q = "select count(*) from post_likesdislikes";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            rs.next();
            count = rs.getInt(1);
            return count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

//   ---------------------------------
//   Total Comments Counts
//   ---------------------------------
    public int totalCommentsCount() {
        int count = 0;
        try {
            String q = "select count(*) from post_comments";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            rs.next();
            count = rs.getInt(1);
            return count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
//         insert like

    public void insertlike(int userid, int postid, int status, String uname) {
        System.out.println("come in like method");
        try {
            String q = "insert into post_likesdislikes(user_id,post_id,likes,username) values('" + userid + "','" + postid + "','" + status + "','" + uname + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removelike(int userid, int postid, String uname) {
        System.out.println("come in to remove  method");
        System.out.println("postid=" + postid);
        System.out.println("uid=" + userid);
        try {
            String q = "delete from post_likesdislikes where user_id='" + userid + "' and post_id='" + postid + "' and username='" + uname + "' ";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);

            System.out.println("deleted");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Vector shouserlikes(String likeuname) {
        Vector vc = new Vector();
        try {
            String q = "select * from post_likesdislikes where username='" + likeuname + "'";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                vc.add(rs.getInt("post_id"));
            }
            return vc;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vc;
    }
//   like count

    public int likecount(int pid) {
        int likecount = 0;
        try {
            String like = "select sum(likes) from post_likesdislikes where post_id='" + pid + "'";
            Statement st2 = con.createStatement();
            ResultSet rs3 = st2.executeQuery(like);
            rs3.next();
            likecount = rs3.getInt(1);
            return likecount;
        } catch (Exception e) {
        }

        return likecount;
    }

    public void usercomment(int pid, int uid, String comment) {
        try {
            String q = "insert into post_comments(post_id,user_id,comment_message) values('" + pid + "','" + uid + "','" + comment + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
        }
    }

//   ---------------------------------
//   Total Comments Counts
//   ---------------------------------
    public int userPostCount(int uid) {
        int postcount = 0;
        try {
            String like = "select count(*) from user_post where user_id='" + uid + "'";
            Statement st2 = con.createStatement();
            ResultSet rs3 = st2.executeQuery(like);
            rs3.next();
            postcount = rs3.getInt(1);
            return postcount;
        } catch (Exception e) {
        }

        return postcount;
    }

    public int comment_delete_user(int cid) {
        int a = 0;
        try {
            String deletecomment = "select user_id from post_comments where cid='" + cid + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(deletecomment);
            while (rs.next()) {
                a = rs.getInt("user_id");
            }
            return a;
        } catch (Exception e) {
        }
        return a;
    }
// delete user commnet

    public void deletecomment(int cid) {
        try {
            String q = "delete from post_comments where cid='" + cid + "'";
            Statement st = con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
        }
    }

// contct user for admin
    public void UserContact(String uname, String report) {
        try {
            System.out.println("uname ::::: "+uname + " report ::: "+report);
            String q = "insert into user_reports(username,report) values('" + uname + "','" + report + "')";
            Statement st = this.con.createStatement();
            st.executeUpdate(q);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
// forgot password

    public void forgotpassword(String email, String friend, String newpassword) {
        System.out.println(email);
         System.out.println(newpassword);
          System.out.println(friend);
        try {
            System.out.println("forget password");
            String q = "select * from u_registration where email='" + email + "' and friend='" + friend + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(q);
             System.out.println("if block password");
            if (rs.next()) {
            
                String q1 = "update u_registration set password='" + newpassword + "' where email='" + email + "'";
                Statement st1 = con.createStatement();
                st1.execute(q1);
                    System.out.println("if block password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
