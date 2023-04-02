import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

GridLayout {
  states: [
    State {
      name: "user"
      PropertyChanges { 
        target: loginTitle
        text: "User Login"
      }
      PropertyChanges { 
        target: loginSubmitButton
        onClicked: handler.userLogin(username.text, password.text);
      }
      PropertyChanges { 
        target: loginToggleScreenButton
        onClicked: { login.state = "admin"; }
      }
      PropertyChanges { 
        target: loginToggleScreenButton
        text: qsTr("Admin Login");
      }
    },
    State {
      name: "admin"
      PropertyChanges { 
        target: loginTitle
        text: "Admin Login"
      }
      PropertyChanges { 
        target: loginSubmitButton
        onClicked: handler.adminLogin(username.text, password.text);
      }
      PropertyChanges { 
        target: loginToggleScreenButton
        onClicked: { login.state = "user"; }
      }
      PropertyChanges { 
        target: loginToggleScreenButton
        text: qsTr("User Login");
      }
    }
  ]
  id: login
  state: "user"
  objectName: "login"
  columns: 2

// INPUT SECTION
  Text {
    id: loginTitle
    Layout.columnSpan: 2
    font.pixelSize: labelTextSize
  }
  Text {
    Layout.rightMargin: labelRightMargin
    text: "Username:"
    font.pixelSize: labelTextSize
  }
  TextInput {
    id: username
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    Layout.rightMargin: labelRightMargin
    text: "Password"
    font.pixelSize: labelTextSize
  }
  TextInput {
    id: password
    text: "pass"
    font.pixelSize: inputTextSize
  }

// SUBMIT SECTION
  Text {
    id: loginFailedText
    Layout.columnSpan: 2
    visible: false
    text: "Your username or password was wrong. Please try again."
    font.pixelSize: labelTextSize
  }

  Button {
    id: loginSubmitButton
    Layout.columnSpan: 2
    Layout.alignment: Qt.AlignCenter
    Layout.topMargin: myTopMargin
    text: qsTr("Login")
    //TODO: handle no radioButton picked error; dont let user click submit if they havent filled out all the fields
  }

// TOGGLE LOGIN SCREEN SECTION
  Button {
    id: loginToggleScreenButton
    Layout.columnSpan: 2
    Layout.alignment: Qt.AlignCenter
    Layout.topMargin: myTopMargin
    font.pixelSize: 10
    onClicked: {
    }
  }
// REGISTER SECTION
  Button {
    Layout.columnSpan: 2
    Layout.alignment: Qt.AlignCenter
    Layout.topMargin: myTopMargin
    text: qsTr("Register")
    font.pixelSize: 10
    onClicked: {
      handler.displayRegistration();
    }
  }
}

