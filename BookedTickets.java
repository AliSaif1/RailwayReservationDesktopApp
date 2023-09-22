package com.example.pro;

import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class BookedTickets {

    String Coach;
    String PassN;
    String SeatNo;

    public BookedTickets(String coach, String passN, String seatNo) {
        Coach = coach;
        PassN = passN;
        SeatNo = seatNo;
    }

    public String getCoach() {
        return Coach;
    }

    public void setCoach(String coach) {
        Coach = coach;
    }

    public String getPassN() {
        return PassN;
    }

    public void setPassN(String passN) {
        PassN = passN;
    }

    public String getSeatNo() {
        return SeatNo;
    }

    public void setSeatNo(String seatNo) {
        SeatNo = seatNo;
    }
}
