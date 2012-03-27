// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 300
    height: 300
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffc0c0"
        }

        GradientStop {
            position: 1
            color: "#434d24"
        }
    }

    Column {
        id: column1
        anchors.fill: parent

        Grid {
            id: grid1
            height: 100
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 5
            columns: 2

            Text {
                id: person_header
                x: 117
                y: 95
                text: qsTr("Person:")
                font.bold: true
                font.pixelSize: 12
            }

            Text {
                id: person_name
                x: 61
                y: -11
                text:"Andy"
                font.pixelSize: 12
            }

            Text {
                id: project_header
                x: 109
                y: 152
                text: qsTr("Project:")
                font.bold: true
                font.pixelSize: 12
            }

            Text {
                id: project_name
                x: 124
                y: 129
                text: "Thesis"
                font.pixelSize: 12
            }

            Text {
                id: progress_header
                x: 134
                y: 152
                text: qsTr("Progress:")
                font.bold: true
                font.pixelSize: 12
            }

            ProgressBar {
                id: progressbar1
                width: 100
                height: 15
                bg_color: "#0054e6"
                progress_ratio: 0.300
            }

            Text {
                id: events_header
                text: qsTr("Events:")
                font.bold: true
                font.pixelSize: 12
            }

            GlassButton {
                id: glassbutton1
                x: 4
                y: 108
                width: 100
                height: 30
                text: "add event"
                bg_color: "#15a2e8"
            }
        }

        ListView {
            id: list_view1
            y: 0
            height: 140
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            delegate: Item {
                x: 5
                height: 40
                Row {
                    id: row1
                    spacing: 10

                    Text {
                        text: name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                    Text {
                        text: date
                        anchors.verticalCenter:  parent.verticalCenter
                        font.bold: false
                    }
                    Text {
                        text: percentage
                        anchors.verticalCenter:  parent.verticalCenter
                        font.bold: false
                    }
                }
            }
            model: ListModel {
                ListElement {
                    name: "Meeting 1"
                    date: "2011-09-12"
                    percentage:"5%"
                }
                ListElement {
                    name: "Meeting 2"
                    date: "2011-10-10"
                    percentage:"17.2%"
                }
                ListElement {
                    name: "Meeting 3"
                    date: "2011-11-13"
                    percentage:"30%"
                }

            }
        }

        GlassButton {
            id: complete_button
            x: 81
            y: 222
            width: 100
            height: 50
            text: "Complete"
            text_color: "#197adb"
            trns_y: 0
            bg_color: "#aa3a11"
        }
    }

}
