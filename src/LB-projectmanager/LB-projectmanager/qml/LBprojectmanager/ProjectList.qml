// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle1
    color: "#ff8888"
    width:300
    height:300

    ListView {
        id: list_view1
        anchors.fill: parent
        delegate: Item {
            x: 5
            height: 40
            Row {
                id: row1
                spacing: 10

                Text {
                    text: person_name
                    anchors.verticalCenter: parent.verticalCenter
                }

                ProgressBar{
                    progress_ratio: progress
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width:100
                }

                Text {
                    text: project_name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
        model: ListModel {
            ListElement {
                person_name: "Andy"
                project_name: "Thesis"
                progress: 0.1
            }

            ListElement {
                person_name: "Bertha"
                project_name: "Cooking"
                progress: 0.789
            }

            ListElement {
                person_name: "Cecil"
                project_name: "Cleaning"
                progress: 0.312
            }

            ListElement {
                person_name: "David"
                project_name: "Fixin' thangs"
                progress: 0.5125
            }
        }
    }

}

