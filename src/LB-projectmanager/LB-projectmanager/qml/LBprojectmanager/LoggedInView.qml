// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    width: 300
    height: 300
    Column {
        anchors.fill: parent;

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
                    console.log('would add project now')
                }
            }
            GlassButton{
                id:filter_projects_button
                text:qsTr("Filter")
                bg_color: "orange"
                text_color: "white"
                height:50

                onClicked: {
                    console.log('would open filter view')
                }
            }
        }
        ProjectList{
            id: project_list
            height: 200
            anchors.right: parent.right
            anchors.left: parent.left
        }

        GlassButton{
            id:logout_button
            height: 50
            text:qsTr("Log out")
            anchors.right: parent.right
            bg_color: "red"
            text_color: "white"

            onClicked: {
                page.state = ''
                login_input.text = 'logged out'
                passwd_input.text = '***, lol'
                console.debug('logout button clicked')
            }
        }
    }
}
