
package com.codebook.bean;
import java.sql.*;
public class Bean {
    private String name;
    private String address;
    private String gender;
    private String DistName;
    private String dob;
    private String email;
    private String mobile;
    private String Cpassword;
    private String password;
    private String temp;
    private String order;
    private Blob image;
    private String flag;
    
    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }
    public void setGender(String gender){
        this.gender=gender;
    }
    public String getGender(){
        return gender;
    }
    public void setFlag(String flag){
        this.flag=flag;
    }
    public String getFlag(){
        return flag;
    }
    public void setOrder(String order){
        this.order=order;
    }
    public String getOrder(){
        return order;
    }
    public void setTemp(String temp){
        this.temp=temp;
    }
    public String getTemp(){
        return temp;
    }
    public void setDistName(String DistName){
        this.DistName=DistName;
    }
    public String getDistName(){
        return DistName;
    }
    
    public void setEmail(String email){
        this.email=email;
    }
    public String getEmail(){
        return email;
    }
    
    public void setDob(String dob){
        this.dob=dob;
    }
    public String getDob(){
        return dob;
    }
    
    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
        return password;
    }
    
     public void setBlob(Blob image){
        this.image=image;
    }
    public Blob getBlob(){
        return image;
    }
    
    public void setMobile(String mobile){
        this.mobile=mobile;
    }
    public String getMobile(){
        return mobile;
    }
    
    public void setCpassword(String Cpassword){
        this.Cpassword=Cpassword;
    }
    public String getCpassword(){
        return Cpassword;
    }
    
    public void setAddress(String address){
        this.address=address;
    }
    public String getAddress(){
        return address;
    }
    
}
