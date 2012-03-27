// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Rectangle {
    id:base
    property bool checked: false
    width: 100
    height: 100
    color: "#00000000"
    border.width: 2
    border.color: "#000000"

    Image {
        id: image1
        opacity: 0
        anchors.fill: parent
        source: "dagobert83_apply.svg"
    }
    MouseArea {
        id: mouse_area1
        anchors.fill: parent

        onClicked: {
            base.checked = !base.checked
            console.log('checkbox clicked')
        }
    }
    states: [
        State {
            name: "checked"

            PropertyChanges {
                target: image1
                opacity: 1
            }
            when: base.checked
        }
    ]
}
