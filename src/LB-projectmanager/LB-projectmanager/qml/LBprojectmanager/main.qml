// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Rectangle {
    id: page
    width: 360
    height: 360
    gradient: Gradient {
        GradientStop {
            position: 0.150
            color: "#759099"
        }

        GradientStop {
            position: 0.830
            color: "#584543"
        }
    }

    Flipable {
        id: flipable1
        transform: Rotation{
            id:flip_rot
            origin.x:flipable1.width/2
            origin.y:flipable1.height/2

            axis.x:0
            axis.y:1
            axis.z:0

            angle:0
        }
        transitions: Transition {
                 NumberAnimation { target: flip_rot; property: "angle"; duration: 1500 }
             }
        back: Rectangle {
            id: rectangle1
            color: "#ffffff"
            opacity: 0
            anchors.fill: parent

            ListView {
                id: list_view1
                anchors.fill: parent
                delegate: Item {
                    x: 5
                    height: 40
                    Row {
                        id: row1
                        spacing: 10
                        Rectangle {
                            width: 40
                            height: 40
                            color: colorCode
                        }

                        Text {
                            text: name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                    }
                }
                model: ListModel {
                    ListElement {
                        name: "Thesis"
                        colorCode: "grey"
                    }

                    ListElement {
                        name: "Cooking"
                        colorCode: "red"
                    }

                    ListElement {
                        name: "Cleaning"
                        colorCode: "blue"
                    }

                    ListElement {
                        name: "Fixin' thangs"
                        colorCode: "green"
                    }
                }
                opacity: 0
            }

            Rectangle {
                id: rectangle2
                x: 6
                y: 0
                width: 200
                height: 200
                color: "#ffffff"
                opacity: 0

                MouseArea {
                    id: mouse_area1
                    x: -136
                    y: 29
                    width: 100
                    height: 100
                    opacity: 0
                    onClicked: {
                        page.state = ''
                        login_input.text = ''
                        passwd_input.text = ''
                    }
                }

                Text {
                    id: text1
                    x: -126
                    y: 32
                    text: qsTr("text")
                    font.pixelSize: 12
                    opacity: 0
                }
            }
    }
        anchors.fill: parent
        front: Column {
            id: column1
            spacing: 10
            anchors.fill: parent

            Text {
                id: login_header
                color: "#ffffff"
                text: qsTr("Login")
                anchors.leftMargin: 0
                anchors.topMargin: 0
                font.pointSize: 16
            }

            Row {
                id: login_row
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 20

                Text {
                    id: login_label
                    color: "#ffffff"
                    text: qsTr("Username")
                    font.pointSize: 12
                    verticalAlignment: Text.AlignVCenter
                }

                TextInput {
                    id: login_input
                    width: 200
                    color: "#ffffff"
                    font.pointSize: 12
                    anchors.verticalCenter: login_label.verticalCenter
                    Keys.onEnterPressed: {
                        page.state = 'project_list'
                        console.log("login enter")
                    }
                    Keys.onReturnPressed: {
                        page.state = 'project_list'
                        console.log("login return")
                    }
                }
            }

            Row {
                id: passwd_row
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 20

                Text {
                    id: passwd_label
                    color: "#ffffff"
                    text: qsTr("Password")
                    font.pointSize: 12
                    verticalAlignment: Text.AlignVCenter
                }

                TextInput {
                    id: passwd_input
                    width: 200
                    font.pointSize: 12
                    anchors.verticalCenter: passwd_label.verticalCenter
                    echoMode: TextInput.Password
                    Keys.onEnterPressed: {
                        page.state = 'project_list'
                        console.log("pw enter")
                    }
                    Keys.onReturnPressed: {
                        page.state = 'project_list'
                        console.log("pw return")
                    }
                }
            }
    }
    }
    states: [
        State {
            name: "project_list"

            PropertyChanges {
                target: flip_rot
                angle:180
            }

            PropertyChanges {
                target: list_view1
                opacity: 1
            }

            PropertyChanges {
                target: rectangle2
                x: 160
                y: 0
                width: 200
                height: 77
                color: "#ff0000"
                opacity: 1
            }

            PropertyChanges {
                target: mouse_area1
                x: 0
                y: 0
                width: 200
                height: 77
                opacity: 1
            }

            PropertyChanges {
                target: text1
                x: 47
                y: 19
                text: qsTr("Log out")
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
                font.pointSize: 24
                opacity: 1
            }
        }
    ]
}
