// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Rectangle {
    id: base
    property bool open: false
    width: 100
    height: 16
    clip: true

    ListView {
        id: list_view1
        width: 100
        height: 75
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        delegate: Text {
            text: name
            height:16
            font.bold: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    base.state = ''
                    console.log('listview delegate clicked:' + parent.text)
                }
            }
        }
        model: ListModel {
            ListElement {
                name: "Alice"
            }

            ListElement {
                name: "Bob"
            }

            ListElement {
                name: "Charlie"
            }

            ListElement {
                name: "Dave"
            }
        }
    }
    Image {
        id: image1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        source: "arrow-down.png"
    }

    MouseArea {
        id: mouse_area1
        anchors.fill: parent
        onClicked: {
            base.state = 'open'
            console.log("dropdown clicked")
        }
    }
    states: [
        State {
            name: "open"
            PropertyChanges {
                target: base
                clip:false
            }
            PropertyChanges {
                target: image1
                opacity:0
            }
        }
    ]
}
