package com.example.pro;

public class Seats {

    String SeatNo;
    String status;

    public Seats(String seatNo, String status) {
        SeatNo = seatNo;
        this.status = status;
    }

    public String getSeatNo() {
        return SeatNo;
    }

    public void setSeatNo(String seatNo) {
        SeatNo = seatNo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
