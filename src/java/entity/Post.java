/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Post {

    private int P_id;
    private int Puser_id;
    private String Title;
    private String Description;
    private String Category;
    private String Postimg_name;

    public Post(int P_id, int Puser_id, String Title, String Description, String Category, String Postimg_name) {
        this.P_id = P_id;
        this.Puser_id = Puser_id;
        this.Title = Title;
        this.Description = Description;
        this.Category = Category;
        this.Postimg_name = Postimg_name;
    }

    public Post() {
    }

    public int getP_id() {
        return P_id;
    }

    public void setP_id(int P_id) {
        this.P_id = P_id;
    }

    public int getPuser_id() {
        return Puser_id;
    }

    public void setPuser_id(int Puser_id) {
        this.Puser_id = Puser_id;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getPostimg_name() {
        return Postimg_name;
    }

    public void setPostimg_name(String Postimg_name) {
        this.Postimg_name = Postimg_name;
    }
    
    

}
