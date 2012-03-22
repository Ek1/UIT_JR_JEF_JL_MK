// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id:base
    property color bg_color: Qt.rgba(0.9, 0.5, 0, 1);
    property color border_color: "black"
    property color text_color: "black"
    property real progress_ratio: 0
    Rectangle {
        anchors.fill: parent
        border.color: base.border_color
        border.width: 1
        color: "transparent"
    }

    Rectangle {
        id: fill
        anchors.left:parent.left
        width:parent.width*parent.progress_ratio
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        gradient: Gradient {
            GradientStop {
                position: 0
                color: Qt.darker(base.bg_color, 2)
            }

            GradientStop {
                position: 0.9
                color: base.bg_color
            }

            GradientStop {
                position: 1
                color: Qt.darker(base.bg_color, 1.5)
            }
        }
    }
    Text {
        id: percentage
        text: (base.progress_ratio * 100).toFixed(1) + '%'
        anchors.centerIn: parent
        color: base.text_color
    }
    Rectangle {
        id: overlay
        anchors.left:parent.left
        width:parent.width*parent.progress_ratio
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        smooth: true
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#00ffffff"
            }

            GradientStop {
                id:center_light_stop
                position: 0.1
                color: "#ffffffff"
            }

            GradientStop {
                position: 0.75
                color: "#00ffffff"
            }
        }
    }
}
