// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Item {
    id:base
    property bool checked: false
    width: 100
    height: 100



    Image {
        id: image3
        anchors.fill: parent
        source: "radio-unchecked.png"
        opacity:1
    }
    states: [
        State {
            name: "checked"

            PropertyChanges {
                target: image2
                opacity: 1
            }
            PropertyChanges {
                target: image3
                opacity: 0
            }
            when: base.checked
        }
    ]
    Image {
        id: image2
        anchors.fill: parent
        source: "radio-checked.png"
        opacity:0
    }
    MouseArea {
        id: mouse_area1
        anchors.fill: parent

        onClicked: {
            base.checked = true
            console.log('radiobutton clicked')
        }
    }
}
