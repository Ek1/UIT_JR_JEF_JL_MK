// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:base
    width: 300
    height: 300
    clip: true
    Column {
        width: parent.width
        height: parent.height

        Row {
            id: row1
            anchors.left: parent.left
            anchors.right: parent.right
            height:50

            GlassButton{
                id:add_project_button
                text:qsTr("Add project")
                bg_color: "blue"
                text_color: "white"
                height:50

                onClicked: {
                    base.state = 'add_project'
                }
            }
            GlassButton{
                id:filter_projects_button
                text:qsTr("Filter")
                bg_color: "orange"
                text_color: "white"
                height:50

                onClicked: {
                    base.state = 'filter_projects'
                }
            }
        }
        ProjectList{
            id: project_list
            height: 200
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }

    AddProjectView {
        id: addprojectview1
        x: parent.width
        y: 0
        width: parent.width
        height: parent.height - logout_button.height
        onDiscard: base.state = ''
        onAdd: base.state = ''
    }

    GlassButton{
        id:logout_button
        x: 172
        y: 250
        height: 50
        text:qsTr("Log out")
        anchors.right: parent.right
        bg_color: "red"
        text_color: "white"

        onClicked: {
            page.state = ''
            base.state = ''
            login_input.text = 'logged out'
            passwd_input.text = '***, lol'
            console.debug('logout button clicked')
        }
    }

    FilterProject {
        id: filterproject1
        x: 0
        y: -height
        height: parent.height - logout_button.height
        onBack: base.state = ''
    }
    states: [
        State {
            name: "add_project"
            PropertyChanges {
                target: addprojectview1
                x:0
            }
        },
        State {
            name: "filter_projects"
            PropertyChanges {
                target: filterproject1
                y:0
            }
        }
    ]
    transitions: Transition {
        NumberAnimation {
            properties: "y,x";
            duration: 500
            easing.type: Easing.OutBack
            easing.overshoot: 3
        }
    }
}
