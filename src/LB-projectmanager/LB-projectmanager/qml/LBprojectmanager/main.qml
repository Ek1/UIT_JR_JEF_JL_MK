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
        back: Rectangle {
            id: rectangle1
            color: "#ff8888"
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

            GlassButton{
                id:logout_button
                text:qsTr("Log out")
                anchors.right: parent.right
                anchors.top: parent.top
                bg_color: "red"
                text_color: "white"

                onClicked: {
                    page.state = ''
                    login_input.text = 'logged out'
                    passwd_input.text = '***, lol'
                    console.debug('logout button clicked')
                }
            }

            Checkbox {
                id: checkbox1
                anchors.left: parent.left
                anchors.bottom: parent.bottom
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
                Rectangle {
                    width: 200
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    border.width: 2
                    border.color: "#ffffff"
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#483533"
                        }

                        GradientStop {
                            position: 1
                            color: "#658089"
                        }
                    }
                    TextInput {
                        id: login_input
                        color: "#ffffff"
                        anchors.fill: parent
                        font.pointSize: 12
                        Keys.onEnterPressed: {
                            page.state = 'logged_in'
                            console.log("login enter")
                        }
                        Keys.onReturnPressed: {
                            page.state = 'logged_in'
                            console.log("login return")
                        }
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

                Rectangle {
                    width: 200
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    border.width: 2
                    border.color: "#ffffff"
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#483533"
                        }

                        GradientStop {
                            position: 1
                            color: "#658089"
                        }
                    }

                    TextInput {
                        id: passwd_input
                        color: "#ffffff"
                        width: 200
                        font.pointSize: 12
                        echoMode: TextInput.Password
                        Keys.onEnterPressed: {
                            page.state = 'logged_in'
                            console.log("pw enter")
                        }
                        Keys.onReturnPressed: {
                            page.state = 'logged_in'
                            console.log("pw return")
                        }
                    }
                }
            }

            GlassButton {
                id: glassbutton1
                text: "Log in"
                anchors.right: parent.right
                onClicked: page.state = 'logged_in'
            }
        }
    }
    states: [
        State {
            name: "logged_in"

            PropertyChanges {
                target: flip_rot
                angle:180
            }
        }
    ]
    transitions: Transition {
        NumberAnimation {
            properties: "angle";
            duration: 500
            easing.type: Easing.OutBack
            easing.overshoot: 3
        }
    }
}
