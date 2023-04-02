import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

ApplicationWindow {
  id: appWindow
  property string test: qsTr("admin")
  property string currentView: qsTr("login.qml")
  property QtObject myModel: ListModel {
    id: listOfBookings
    ListElement { firstName: "sadf"; surname: "asdf" }
    ListElement { firstName: "Sam"; surname: "Tonks" }
  }
  property int labelTextSize: 18
  property int inputTextSize: 18
  property int labelRightMargin: 50
  property int myTopMargin: 40
  font.pixelSize: labelTextSize
  visibility: ApplicationWindow.Maximized
  visible: true
// TODO: fix below variables
  title: "Booking!"

  Loader {
    anchors.centerIn: parent
    anchors.fill: parent
    id: loader
    source: currentView
  }

  /*
  ListModel {
    id: listOfBookings
    ListElement { firstName: "EElasdfasdfasdfsdafasElasdfasdfasdfsdafasElasdfasdfasdfsdafaslasdfasdfasdfsdafaswyn"; surname: "Tonks" }
    ListElement { firstName: "Sam"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
    ListElement { firstName: "Russell"; surname: "Tonks" }
  }
  */

  Component {
    id: bookingEntry
      Text { 
        text: firstName
      font.pixelSize: 40
      }
    }

  Component {
    id: homeButton
    Button {
      text: qsTr("Home")
      onClicked: {
        handler.displayHome();
      }
    }
  }
}
