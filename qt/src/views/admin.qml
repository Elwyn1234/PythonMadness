import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

ColumnLayout {
  anchors.topMargin: 40

Rectangle {
  color: "#a0a0aa"
  Layout.minimumHeight: loader.height - 100
  Layout.minimumWidth: loader.width - 60
  Layout.alignment: Qt.AlignHCenter

  ListView {
    id: bookingList
    anchors.fill: parent
    model: myModel
    delegate: bookingEntry
    clip: true

    ScrollBar.vertical: ScrollBar {
      policy: ScrollBar.AlwaysOn
    }
  }
}

  Loader {
    sourceComponent: homeButton
  }
}
