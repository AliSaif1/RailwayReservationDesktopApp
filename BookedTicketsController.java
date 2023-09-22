package com.example.pro;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class BookedTicketsController implements Initializable {

    @FXML
    private TableColumn<BookedTickets,String> CoahNo;

    @FXML
    private TableColumn<BookedTickets,String> PassName;

    @FXML
    private TableView<BookedTickets> ReserveTable;

    @FXML
    private TableColumn<BookedTickets,String> SeatNo;

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

    String id;

	public void set(String id){
		 this.id=id;
	}

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        String userID = "03058761739";
        CoahNo.setCellValueFactory(new PropertyValueFactory("Coach"));
        PassName.setCellValueFactory(new PropertyValueFactory("PassN"));
        SeatNo.setCellValueFactory(new PropertyValueFactory("SeatNo"));
        ReserveTable.setItems(DBConnectivity.bookedTickets(userID));

        Platform.runLater(()->{
            System.out.println(id);
        });
    }
}
