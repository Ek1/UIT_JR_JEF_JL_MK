// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: base
    width: 128
    height: 64
    scale:1
    transform: Translate{
        id: translation
        y:0
    }
    property color text_color: "white"
    property color bg_color: Qt.rgba(0.5,1,0.5,1);
    signal clicked()
    property alias text: buttontext.text;

    Rectangle {
        id: background
        radius: 24
        anchors.fill: parent

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
        id: buttontext
        color: base.text_color
        text: qsTr("buttontext")
        font.pointSize: 12
        font.family: "Liberation Sans"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: overlay
        radius: 24
        anchors.fill: parent
        anchors.bottomMargin: 2
        anchors.topMargin: 2
        anchors.rightMargin: 2
        anchors.leftMargin: 2
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

        MouseArea {
            id: mouse_area1
            anchors.fill: parent
            onPressed: {
                base.state = 'pressed'
                console.log('glassbutton.pressed')
            }
            onReleased: {
                base.state = ''
                console.log('glassbutton.released')
            }
            onClicked: base.clicked()
        }
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: base
                scale:0.95
            }
            PropertyChanges {
                target: translation
                y:10
            }

        }
    ]
}
