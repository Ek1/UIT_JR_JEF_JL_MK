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
            opacity: 1
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
                opacity: 1
            }

            GlassButton{
                id:logout_button
                text:qsTr("Log out")
                anchors.right: parent.right
                anchors.top: parent.top

                onClicked: {
                    page.state = ''
                    login_input.text = 'logged out'
                    passwd_input.text = '***, lol'
                    console.debug('logout button clicked')
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
    }
    states: [
        State {
            name: "project_list"

            PropertyChanges {
                target: flip_rot
                angle:180
            }
        }
    ]
    transitions: Transition {
        NumberAnimation { properties: "angle"; duration: 500 }
    }
}
