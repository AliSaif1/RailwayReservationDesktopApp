//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.example.pro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class DBConnectivity {
    private static Connection connection = null;
    private static PreparedStatement preparedStatement = null;
    private static final String databaseName = "Table Name";
    private static final String userName = "userName";
    private static final String password = "YOUR PASSWORD";


    public DBConnectivity() {
    }

    public static ObservableList<String> fetchTrainItems() {
        ObservableList<String>  list = FXCollections.observableArrayList();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("SELECT * FROM TrainStations");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String StationName=resultSet.getString("StationName");
                list.add(StationName);
            }
        } catch (Exception var14) {
            var14.printStackTrace();
        }

        return list;
    }


    public  static  ObservableList<String> searchTrain(String fCity,String tcity,String date){
        System.out.println("my city " +fCity);
        ObservableList<String> available =FXCollections.observableArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select * from TrainStations\n" +
                    "inner join TrainDate on TrainDate.TrainID = TrainStations.TrainID\n" +
                    "inner join Train on Train.TrainID = TrainStations.TrainID\n"+
                    "where  StationName='"+fCity+"'  and departureDate = '"+date+"'\n" +
                    "having TrainStations.stationNo < (select stationNo from TrainStations\n" +
                    "where StationName = '"+tcity+"')");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String StationName=resultSet.getString("TrainName");
                available.add(StationName);
            }

        } catch (Exception var14) {
            var14.printStackTrace();
        }
         return  available;
    }

    public static ObservableList<Seats>  Seats(String Coach, String Train){

        ObservableList<Seats> seats = FXCollections.observableArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select *, (count(CoachSeats.SeatNo) - count(Reservation.SeatNo)) from CoachSeats\n" +
                    "inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo\n" +
                    "inner join Train on Train.TrainID = TrainCoach.TrainID\n" +
                    "left join Reservation on Reservation.SeatNo = CoachSeats.SeatNo and Reservation.CoachNo = CoachSeats.CoachNo\n" +
                    "where Reservation.SeatNo is null\n" +
                    "group by TrainCoach.TrainID,TrainCoach.CoachType,CoachSeats.SeatNo\n" +
                    "having TrainCoach.CoachType = '"+Coach+"' and Train.TrainName = '"+Train+"'\n");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String StationName=resultSet.getString("SeatNo");
                System.out.println(StationName);
                Seats seats1=new Seats(StationName,"unBooked");
                seats.add(seats1);
            }

        } catch (Exception var14) {
            var14.printStackTrace();
        }
        return seats;
    }

    public static String ticketPrice(String Coach, String Train) {

        String fee = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select * from TrainStations\n" +
                    "inner join TrainCoach on TrainCoach.TrainID = TrainStations.TrainID\n" +
                    "inner join Train on Train.TrainID = TrainStations.TrainID\n" +
                    "where  Train.TrainName = '"+Train+"' and TrainCoach.CoachType = '"+Coach+"'\n" +
                    "group by TicketFee\n");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                fee = resultSet.getString("TicketFee");
                System.out.println(fee);
            }

        } catch (Exception var14) {
            var14.printStackTrace();
        }
        return fee;
    }

    public static ObservableList<Trains> seeStations(String Train){

        ObservableList<Trains> stations = FXCollections.observableArrayList();
        System.out.println(Train);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select * from TrainStations\n" +
                    "inner join Train on Train.TrainID = TrainStations.TrainID\n" +
                    "where Train.TrainName = '"+Train+"'");
            ResultSet resultSet = preparedStatement.executeQuery();

           String arr = null;
            String time = null;
            while(resultSet.next()) {

                String dept = resultSet.getString("StationName");
                if(arr == null){
                    arr = dept;
                    time = resultSet.getString("departureTime");
                    continue;
                }
                Trains trains = new Trains(arr,dept,time);
                time = resultSet.getString("departureTime");
                arr = dept;
                stations.add(trains);
            }
        } catch (Exception var14) {
            var14.printStackTrace();
        }
        return stations;
    }

    public  static ObservableList<String> getAllTrains(){
        ObservableList<String > trainers = FXCollections.observableArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select * from Train");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String Name=resultSet.getString("TrainName");
                trainers.add(Name);
            }

        } catch (Exception var14) {
            var14.printStackTrace();
        }
        return  trainers;
    }

    public static ObservableList<BookedTickets> bookedTickets(String userID){
        ObservableList<BookedTickets > tickets = FXCollections.observableArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/RailwayTicketReservation", "root", password);
            preparedStatement = connection.prepareStatement("select * from Reservation\n" +
                    "where UserID ='"+userID+"'");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String SeatNo=resultSet.getString("SeatNo");
                String CoachNo =resultSet.getString("CoachNo");
                String Name =resultSet.getString("PassengerName");

                BookedTickets bookedTickets=new BookedTickets(CoachNo,Name,SeatNo);
                tickets.add(bookedTickets);
            }

        } catch (Exception var14) {
            var14.printStackTrace();
        }
     return  tickets;
    }
}
