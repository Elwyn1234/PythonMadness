import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

GridLayout {
  columns: 2

// DAYS SECTION
  Text {
    text: "Select date:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: date
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Days:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: days
    text: test
    font.pixelSize: inputTextSize
  }
// ACCOMODATION SECTION
  ButtonGroup {
    id: accomodationButtonGroup
  }
  Text {
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Accomodation:")
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  RadioButton {
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Paradise Villa")
    ButtonGroup.group: accomodationButtonGroup
  }
  RadioButton {
    Layout.column: 1
    Layout.row: 3
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Sunshine Hut")
    ButtonGroup.group: accomodationButtonGroup
  }
  RadioButton {
    Layout.column: 1
    Layout.row: 4
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Standard Cabin")
    ButtonGroup.group: accomodationButtonGroup
  }
  RadioButton {
    Layout.column: 1
    Layout.row: 5
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Treehouse")
    ButtonGroup.group: accomodationButtonGroup
  }
  RadioButton {
    Layout.column: 1
    Layout.row: 6
    Layout.alignment: Qt.AlignVCenter
    text: qsTr("Classic Tipi")
    ButtonGroup.group: accomodationButtonGroup
  }
// PRICE SECTION
  Text {
    Layout.topMargin: myTopMargin
    text: "Accomodation price:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    Layout.topMargin: myTopMargin
    id: accomodationPrice
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: qsTr("Card fee:")
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: cardFee
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Subtotal:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: cost
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "14 day discount:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: discount
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Price after discount:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: priceAfterDiscount
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "VAT:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: vat
    text: test
    font.pixelSize: inputTextSize
  }

  Text {
    text: "Total:"
    font.pixelSize: labelTextSize
    Layout.rightMargin: labelRightMargin
  }
  TextInput {
    id: total
    text: test
    font.pixelSize: inputTextSize
  }
// SUBMIT SECTION
  Button {
    Layout.columnSpan: 2
    Layout.alignment: Qt.AlignCenter
    Layout.topMargin: myTopMargin
    text: qsTr("Submit")
    onClicked: {
      handler.book(date.text, days.text, accomodationButtonGroup.checkedButton.text); //TODO: handle no radioButton picked error; dont let user click submit if they havent filled out all the fields
    }
  }


  Loader {
    sourceComponent: homeButton
  }
}
