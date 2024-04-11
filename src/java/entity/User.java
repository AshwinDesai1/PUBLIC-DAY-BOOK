package entity;

public class User {

    private int user_id;
    private String full_name;
    private String user_name;
    private String city;
    private String address;
    private String email;
    private String mobileno;
    private String password;
    private String gender;
    private String profileimg;
    private String reg_datetime;
    private String user_status;

    public User(int user_id, String full_name, String user_name, String city, String address, String email, String mobileno, String password, String gender, String profileimg) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.user_name = user_name;
        this.city = city;
        this.address = address;
        this.email = email;
        this.mobileno = mobileno;
        this.password = password;
        this.gender = gender;
        this.profileimg = profileimg;
    }

    public User(int user_id, String full_name, String user_name, String city, String address, String email, String mobileno, String password, String gender, String profileimg, String reg_datetime, String user_status) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.user_name = user_name;
        this.city = city;
        this.address = address;
        this.email = email;
        this.mobileno = mobileno;
        this.password = password;
        this.gender = gender;
        this.profileimg = profileimg;
        this.reg_datetime = reg_datetime;
        this.user_status = user_status;
    }
    

    public User() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfileimg() {
        return profileimg;
    }

    public void setProfileimg(String profileimg) {
        this.profileimg = profileimg;
    }

    public String getReg_datetime() {
        return reg_datetime;
    }

    public void setReg_datetime(String reg_datetime) {
        this.reg_datetime = reg_datetime;
    }

    public String getUser_status() {
        return user_status;
    }

    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }
    
    

}
