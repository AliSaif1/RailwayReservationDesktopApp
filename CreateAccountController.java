package com.example.pro;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

import java.io.IOException;

public class CreateAccountController {

    @FXML
    private Label Err1;
    @FXML
    private TextField Lastname;

    @FXML
    private PasswordField Password;

    @FXML
    private TextField firstName;

    @FXML
    private TextField userId;
    
    @FXML
    private Pane SignUpPage;

    @FXML
    private Pane LoginPage;
    
    Stage stage;
    Scene scene;
    Parent root;

    @FXML
    private Label ErrorLabel;

    @FXML
    private Hyperlink Err;

    @FXML
    void register(ActionEvent event) throws IOException {
        LoginPage.setTranslateX(-320);
        LoginPage.setVisible(false);
        SignUpPage.setTranslateX(0);
        SignUpPage.setVisible(true);
    }

    public int CreateAccount(ActionEvent event) throws IOException {

        String Mobile=userId.getText();
        String first=firstName.getText();
        String Last=Lastname.getText();
        String pass=Password.getText();

        if(Mobile.equals("")||first.equals("")||
                Last.equals("")||pass.equals("")){
        // signup.setText("Fill all Fields ");
        // signup.setTextFill(Color.color(1,0,0));
        //  return  0;
        }

        User user1 = new User(first,Mobile,Last,pass);
        FXMLLoader fxmlLoader =  new FXMLLoader(this.getClass().getResource("Home.fxml"));
        root = fxmlLoader.load();
        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
        stage.setUserData(user1);
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
        return 0;
    }

    @FXML
    void SwapSignUp(ActionEvent event) {
        LoginPage.setTranslateX(-320);
        LoginPage.setVisible(false);
        SignUpPage.setTranslateX(0);
        SignUpPage.setVisible(true);
    }

    @FXML
    void SwapLogin(ActionEvent event) {
        LoginPage.setTranslateX(0);
        LoginPage.setVisible(true);
        SignUpPage.setTranslateX(300);
        SignUpPage.setVisible(false);
    }
}
