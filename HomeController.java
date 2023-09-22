package com.example.pro;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class HomeController implements Initializable {

    @FXML
    private ComboBox<String> FCity;

    @FXML
    private ComboBox<String> Tcity;

    @FXML
    private DatePicker Date;

    Stage stage;
    Scene scene;
    Parent root;

    public void initialize(URL url, ResourceBundle resourceBundle) {
        FCity.setItems( DBConnectivity.fetchTrainItems());
        Tcity.setItems(DBConnectivity.fetchTrainItems());
    }

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
        //root = FXMLLoader.load(getClass().getResource("Reserve.fxml"));
        FXMLLoader fxmlLoader=new FXMLLoader(getClass().getResource("Reserve.fxml"));
        root=fxmlLoader.load();
        BookedTicketsController bookedTicketsController=fxmlLoader.getController();
        bookedTicketsController.set("123321");
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();

        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    private void search(ActionEvent event) throws IOException {
        String fcity = FCity.getSelectionModel().getSelectedItem();
        String tcity = Tcity.getSelectionModel().getSelectedItem();
        String date = String.valueOf(Date.getValue());

        Trains trains = new Trains(fcity,tcity,date);

        FXMLLoader fxmlLoader =  new FXMLLoader(this.getClass().getResource("BookTicket.fxml"));
        root = fxmlLoader.load();
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        stage.setUserData(trains);
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
}
