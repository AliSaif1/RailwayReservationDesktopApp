package com.example.pro;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class TrainStationController   implements Initializable {

    @FXML
    private TableColumn<Trains, String> Arr;

    @FXML
    private TableColumn<Trains, String> Dept;

    @FXML
    private TableView<Trains> TrainTable;

    @FXML
    private TableColumn<Trains, String> Time;

    @FXML
    private ComboBox<String> AllTrains;

    Parent root;
    Stage stage;
    Scene scene;

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

    public void initialize(URL url, ResourceBundle resourceBundle) {

        AllTrains.setItems(DBConnectivity.getAllTrains());
        AllTrains.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String s, String t1) {
                Arr.setCellValueFactory(new PropertyValueFactory("arr"));
                Dept.setCellValueFactory(new PropertyValueFactory("dept"));
                Time.setCellValueFactory(new PropertyValueFactory("date"));

                TrainTable.setItems(DBConnectivity.seeStations(t1));
            }
        });
    }
}
