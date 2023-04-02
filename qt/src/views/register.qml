import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

GridLayout {
  columns: 2

// INPUT SECTION
  Text {
    text: "Username:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: username
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Password:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: password
    text: "pass"
    font.pixelSize: inputTextSize
  }

  Text {
    text: "First name:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: firstName
    text: "first"
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Last name:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: lastName
    text: "last"
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Email:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: email
    text: "mail"
    font.pixelSize: inputTextSize
  }

// SUBMIT SECTION
  Button {
    Layout.columnSpan: 2
    Layout.alignment: Qt.AlignCenter
    Layout.topMargin: myTopMargin
    text: qsTr("Register")
    onClicked: {
      handler.register(username.text, password.text, firstName.text, lastName.text, email.text); //TODO: handle no radioButton picked error; dont let user click submit if they havent filled out all the fields
    }
  }


  Loader {
    sourceComponent: homeButton
  }
}

