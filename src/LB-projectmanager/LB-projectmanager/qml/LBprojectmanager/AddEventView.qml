// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle6
    width: 300
    height: 100
    color: "#b7d3a7"

    Grid {
        id: grid1
        anchors.fill: parent
        spacing: 5
        rows: 2
        columns: 5

        Text {
            id: text1
            x: 48
            y: 64
            text: qsTr("Explanation")
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 146
            y: -28
            text: qsTr("Year")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 158
            y: -16
            text: qsTr("Month")
            font.pixelSize: 12
        }

        Text {
            id: text4
            x: 163
            y: -9
            text: qsTr("Day")
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: 135
            y: 45
            text: qsTr("Progress")
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle1
            width: 100
            height: 20
            color: "#ffffff"

            TextInput {
                id: description_input
                text: qsTr("text")
                anchors.fill: parent
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: rectangle2
            x: -7
            y: 7
            width: 40
            height: 20
            color: "#ffffff"
            TextInput {
                id: year_input
                text: new Date().getFullYear()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator
            }
        }

        Rectangle {
            id: rectangle3
            x: -8
            y: 0
            width: 20
            height: 20
            color: "#ffffff"
            TextInput {
                id: month_input
                text: 1 + new Date().getMonth()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator{bottom: 1; top:12}
            }
        }

        Rectangle {
            id: rectangle4
            x: -8
            y: -2
            width: 20
            height: 20
            color: "#ffffff"
            TextInput {
                id: day_input
                text: new Date().getDate()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator{bottom: 1; top:31}
            }
        }

        Rectangle {
            id: rectangle5
            x: 0
            y: 9
            width: 40
            height: 20
            color: "#ffffff"
            TextInput {
                id: progress_input
                text: "0"
                font.pixelSize: 12
                anchors.fill: parent
                validator: DoubleValidator{bottom: 0; top:100}
            }
        }
    }

    GlassButton {
        id: discardButton
        x: 44
        y: 219
        width: 128
        height: 31
        text: "Discard"
        anchors.bottom: parent.bottom
        anchors.right: glassbutton2.left
        bg_color: "#800000"
    }

    GlassButton {
        id: glassbutton2
        x: 172
        y: 219
        width: 128
        height: 31
        text: "Add"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
