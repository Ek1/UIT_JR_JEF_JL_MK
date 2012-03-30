// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle1
    width: 200
    height: 100
    color: "#feb3ff"

    Text {
        id: firstname_label
        text: qsTr("First name")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 12
    }

    Rectangle {
        id: rectangle2
        height: firstname_label.height
        color: "#ffffff"
        border.color: "#000000"
        anchors.right: parent.right
        anchors.left: firstname_label.right
        anchors.top: parent.top

        TextInput {
            id: firstname_input
            anchors.fill: parent
            font.pixelSize: 12
        }
    }

    Text {
        id: lastname_label
        x: 0
        y: -5
        text: qsTr("Last name")
        font.pixelSize: 12
        anchors.top: firstname_label.bottom
        anchors.left: parent.left
    }

    Rectangle {
        id: rectangle3
        x: 4
        y: 0
        height: firstname_label.height
        color: "#ffffff"
        border.color: "#000000"
        anchors.top: rectangle2.bottom
        TextInput {
            id: firstname_input1
            font.pixelSize: 12
            anchors.fill: parent
        }
        anchors.right: parent.right
        anchors.left: firstname_label.right
    }

    GlassButton {
        id: discard_button
        y: 36
        width: parent.width/2
        height: 32
        text: "Discard"
        bg_color: "#8d0f0f"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    GlassButton {
        id: add_button
        width: parent.width/2
        height: 32
        text: "add"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
}
