// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: background
    width: 128
    height: 64
    radius: 24
    scale:1
    property alias trns_y: translation.y
    transform: Translate{
        id: translation
        y:0
    }
    color: Qt.rgba(0.5,1,0.5,1);
    signal clicked()

    property alias text: buttontext.text;

    gradient: Gradient {
        GradientStop {
            position: 0
            color: Qt.rgba(0,0.5,0,1);
        }

        GradientStop {
            position: 0.9
            color: background.color;
        }

        GradientStop {
            position: 1
            color: Qt.rgba(0,0.75,0,1);
        }
    }

    Text {
        id: buttontext
        color: "#000000"
        text: qsTr("buttontext")
        font.pointSize: 12
        font.family: "Liberation Sans"
        font.bold: true
        styleColor: "#565e56"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: overlay
        radius: 24
        anchors.bottomMargin: 2
        anchors.topMargin: 2
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        smooth: true
        gradient: Gradient {
            id:glow
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
        anchors.fill: parent

        MouseArea {
            id: mouse_area1
            anchors.fill: parent
            onPressed: {
                background.state = 'pressed'
                console.log('glassbutton.pressed')
            }
            onReleased: {
                background.state = ''
                console.log('glassbutton.released')
            }
            onClicked: background.clicked()
        }
    }

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: background
                scale:0.95
                trns_y:10
            }
        }
    ]
}
