import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    RowLayout{
        anchors.topMargin: 0
        anchors.leftMargin: 0

        Image{
            id: imPlay
            source:"images/action_play.png"
        }
        Image{
            id: imPause
            source:"images/action_pause.png"
        }

        ToggleButton{
            width:40; height: 40
            id: startStop
        }

        Button{
            text: "Turn On"
            onClicked: startStop.setOn()
        }
        Button{
            text: "Turn Off"
            onClicked: startStop.setOff()
        }
    }
}
