package com.example.pro;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.ArrayList;

public class BookTicketController{

    @FXML
    private ChoiceBox<String> Coach;

    @FXML
    private TableColumn<Seats, String> SeatNo;

    @FXML
    private TableView<Seats> SeatTable;

    @FXML
    private TableColumn<Seats, String> status;

    @FXML
    private ChoiceBox<String> available;

    @FXML
    private Pane booking;

    @FXML
    private Label link;

    @FXML
    private Button BookTicket;

    @FXML
    private Button price;

    String dept;
    String arr;
    String date;

    Stage stage;
    Scene scene;
    Parent root;

    @FXML
    void seeStations(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("Train Stations.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void goToHome(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("Home.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void register(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("Create-Account.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void reserveTickets(ActionEvent event) throws IOException {
        root = FXMLLoader.load(getClass().getResource("Reserve.fxml"));
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    void searchTrains(MouseEvent event) {

        booking.setVisible(true);
        Node node = (Node) event.getSource();
        Stage stage = (Stage) node.getScene().getWindow();;
        stage.getUserData();
        Trains trains = (Trains) stage.getUserData();
        this.dept = trains.getDept();
        this.arr = trains.getArr();
        this.date = trains.getDate();
        ArrayList<String> bus=new ArrayList<>();
        bus.add("Business");
        bus.add("Economy");
        bus.add("AC Class");
        ObservableList<String> C = FXCollections.observableArrayList(bus);
        Coach.setItems(C);

        available.setItems(DBConnectivity.searchTrain(dept,arr,date));
        Coach.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String s, String t1) {
                String ava= available.getSelectionModel().getSelectedItem();
                System.out.println(ava);

                price.setText(DBConnectivity.ticketPrice(t1,ava));
                SeatNo.setCellValueFactory(new PropertyValueFactory("SeatNo"));
                status.setCellValueFactory(new PropertyValueFactory("status"));
                SeatTable.setItems(DBConnectivity.Seats(t1,ava));
                BookTicket.setVisible(true);
            }
        });
        link.setVisible(false);
    }

    @FXML
    void BookedSeats(MouseEvent event) {
        Seats seats=SeatTable.getSelectionModel().getSelectedItem();
        seats.setStatus("Booked");
        SeatTable.getItems().set(SeatTable.getSelectionModel().getSelectedIndex()  ,seats);

        int row=SeatTable.getSelectionModel().getSelectedIndex();
        System.out.println(row);
        changeValueAt(row,1,"Booked",SeatTable);

        // SeatTable.getItems().remove(seats);
        // seats.setStatus("Booked");
        // SeatTable.getItems().add(seats);
        //System.out.println(seats.getSeatNo());

        if(seats.getStatus().equals("unBooked")){
            seats.setStatus("Booked");
        } else{
            seats.setStatus("unBooked");
        }
    }

    @FXML
    void Booked(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader =  new FXMLLoader(this.getClass().getResource("Reserve.fxml"));
        root = fxmlLoader.load();
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        stage.setUserData("03058761739");
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
    private static void changeValueAt(int row, int col, String value, TableView<Seats> table) {
        ObservableList newData = (ObservableList) table.getItems().get(row);
        newData.set(col, value);
        // table.getItems().set(row, (Seats) newData);

//        Seats newData = table.getItems().get(row);
//        System.out.println("row is"+row);
//        newData.setStatus("Booked");
//        table.getItems().set(row,  newData);
    }
}
