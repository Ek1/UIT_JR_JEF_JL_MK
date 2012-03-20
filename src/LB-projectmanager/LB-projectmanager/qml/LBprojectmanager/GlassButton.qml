// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: backgound
    width: 128
    height: 64
    radius: 24
    property alias color: bg_stop2.color;
    property alias text: buttontext.text;
    gradient: Gradient {
        GradientStop {
            position: 0
            color:"#006e0c"

        }

        GradientStop {
            id:bg_stop2
            position: 0.90
            color: "#00ff00"
        }

        GradientStop {
            position: 1
            color: "#2cbe00"
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
        anchors.bottomMargin: -1
        anchors.topMargin: 1
        anchors.rightMargin: 1
        anchors.leftMargin: 1
        smooth: true
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#40ffffff"
            }

            GradientStop {
                position: 0.1
                color: "#ffffff"
            }

            GradientStop {
                position: 0.750
                color: "#00ffffff"
            }
        }
        anchors.fill: parent

        MouseArea {
            id: mouse_area1
            anchors.fill: parent
        }
    }

}
