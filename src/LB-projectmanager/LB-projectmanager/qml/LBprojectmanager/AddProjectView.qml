// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle2
    width: 300
    height: 200
    color: "#d3a7b7"

    Grid {
        id: grid1
        anchors.bottom: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        spacing: 5
        rows: 2
        columns: 3

        Text {
            id: ownertext
            x: 35
            y: 84
            text: qsTr("Owner")
            font.pixelSize: 12
        }

        Text {
            id: persontext
            x: 42
            y: 92
            text: qsTr("Person")
            font.pixelSize: 12
        }

        Text {
            id: nametext
            x: 26
            y: 77
            text: qsTr("Project name")
            font.pixelSize: 12
        }

        Dropdown {
            id: dropdown1
            x: 43
            y: 107
        }

        Dropdown {
            id: dropdown2
            x: 90
            y: 126
        }

        Rectangle {
            id: rectangle1
            width: 90
            height: dropdown2.height
            color: "#ffffff"

            TextInput {
                id: project_name_input
                text: qsTr("text")
                anchors.fill: parent
                font.pixelSize: 12
            }
        }
    }

    Grid {
        id: date_grid
        spacing: 5
        rows: 3
        columns: 4
        anchors.top: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        property int now: new Date().getTime()
        property int one_week: 7 * 24 * 3600 * 1000

        Item {
            id: empty_item
            width: 1
            height: 1
        }

        Text {
            id: year_header
            x: 48
            y: 16
            text: qsTr("Year")
            font.pixelSize: 12
        }

        Text {
            id: month_header
            x: 106
            y: 40
            text: qsTr("Month")
            font.pixelSize: 12
        }

        Text {
            id: day_header
            x: 140
            y: -15
            text: qsTr("Day")
            font.pixelSize: 12
        }

        Text {
            id: start_date_text
            x: 23
            y: 34
            text: "Start date"
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle3
            width: 40
            height: 15
            color: "#ffffff"
            TextInput {
                id: start_year_input
                text: new Date(date_grid.now - date_grid.one_week).getFullYear()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator
            }
        }

        Rectangle {
            id: rectangle4
            x: -5
            y: 0
            width: 20
            height: 15
            color: "#ffffff"
            TextInput {
                id: start_month_input
                text: 1 + new Date(date_grid.now - date_grid.one_week).getMonth()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator {bottom: 1; top:12}
            }
        }

        Rectangle {
            id: rectangle5
            x: 5
            y: 8
            width: 20
            height: 15
            color: "#ffffff"
            TextInput {
                id: start_day_input
                text: new Date(date_grid.now - date_grid.one_week).getDate()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator {bottom:1; top:31}
            }
        }

        Text {
            id: due_date_text
            x: 27
            y: 27
            text: qsTr("Due date")
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle6
            x: -1
            y: 7
            width: 40
            height: 15
            color: "#ffffff"
            TextInput {
                id: due_year_input
                text: new Date(date_grid.now + date_grid.one_week).getFullYear()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator
            }
        }

        Rectangle {
            id: rectangle7
            x: -2
            y: -9
            width: 20
            height: 15
            color: "#ffffff"
            TextInput {
                id: due_month_input
                text: 1 + new Date(date_grid.now + date_grid.one_week).getMonth()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator {bottom: 1; top:12}
            }
        }

        Rectangle {
            id: rectangle8
            x: 2
            y: 17
            width: 20
            height: 15
            color: "#ffffff"
            TextInput {
                id: due_day_input
                text: new Date(date_grid.now + date_grid.one_week).getDate()
                font.pixelSize: 12
                anchors.fill: parent
                validator: IntValidator {bottom: 1; top:31}
            }
        }
    }

    GlassButton {
        id: discard_button
        height: 32
        text: "Discard"
        anchors.right: add_button.left
        anchors.bottom: parent.bottom
        bg_color: "#950101"
    }

    GlassButton {
        id: add_button
        height: 32
        text: "Add"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }
}
