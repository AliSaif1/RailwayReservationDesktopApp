package com.example.pro;

public class Trains {
    String dept;
    String arr;
    String date;

    public Trains(String dept, String arr, String date) {
        this.dept = dept;
        this.arr = arr;
        this.date = date;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getArr() {
        return arr;
    }

    public void setArr(String arr) {
        this.arr = arr;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String time) {
        this.date = time;
    }
}
