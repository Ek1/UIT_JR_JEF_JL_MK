// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle1
    width: 300
    height: 300
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#dfe282"
        }

        GradientStop {
            position: 1
            color: "#347170"
        }
    }

    Row {
        id: row1
        width: 300
        height: 29
        spacing: 7
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        Checkbox {
            id: checkbox1
            width: height
            checked: false
            anchors.bottom: parent.bottom
            anchors.top: parent.top
        }

        Text {
            id: text1
            text: qsTr("Show only projects for")
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        Dropdown {
            id: dropdown1
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Row {
        id: row2
        x: 4
        y: -2
        width: 300
        height: 29
        anchors.topMargin: 5
        spacing: 7
        anchors.top: row1.bottom
        Checkbox {
            id: checkbox2
            width: height
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Text {
            id: text2
            text: qsTr("Show only")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
            anchors.verticalCenter: parent.verticalCenter
        }

        Radiobutton {
            id: radiobutton1
            width: height
            checked: true
            anchors.bottom: parent.bottom
            anchors.top: parent.top
        }

        Text {
            id: text3
            text: qsTr("complete")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }

        Radiobutton {
            id: radiobutton2
            y: 0
            width: height
            checked: false
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Text {
            id: text4
            text: qsTr("incomplete")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
        }
        anchors.right: parent.right
        anchors.left: parent.left
    }

    Flow {
        id: row3
        x: 0
        y: 1
        width: 300
        height: 29
        anchors.topMargin: 5
        spacing: 7
        anchors.top: row2.bottom
        Checkbox {
            id: checkbox3
            width: height
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        Text {
            id: text5
            text: qsTr("Show  projects that are between")
            font.pixelSize: 12
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: rectangle2
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter

            TextInput {
                id: text_input1
                text: qsTr("10")
                anchors.fill: parent
                font.pixelSize: 12
        }
            }

        Text {
            id: text6
            y: 14
            text: qsTr("% and ")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }
        Rectangle {
            id: rectangle3
            x: -1
            y: -6
            width: 16
            height: 16
            TextInput {
                id: text_input3
                text: qsTr("30")
                font.pixelSize: 12
                anchors.fill: parent
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: text7
            x: 125
            y: 37
            text: qsTr("% complete")
            font.pixelSize: 12
        }


        anchors.right: parent.right
        anchors.left: parent.left
    }

    ProjectList {
        id: projectlist1
        anchors.topMargin: 28
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: row3.bottom
    }

    GlassButton {
        id: glassbutton1
        height: 32
        text: "Back"
        bg_color: "#6e58ff"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }
}
