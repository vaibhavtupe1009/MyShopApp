
package com.AradhanaMilkAndBekary.Entities;

public class User {
    private int id;
    private String name;
    private String moNo;

    public User(String name, String moNo, String password, String gender, String address, String email, String profile) {
        this.name = name;
        this.moNo = moNo;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.profile = profile;
    }
    private String password;
    private String gender;
    private String address;
    private String email;
    private String profile;

    public User(int id, String name, String moNo, String password, String gender, String address, String email, String profile) {
        this.id = id;
        this.name = name;
        this.moNo = moNo;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.profile = profile;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMoNo() {
        return moNo;
    }

    public void setMoNo(String moNo) {
        this.moNo = moNo;
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

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
}

