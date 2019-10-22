import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int isEnabled: 1

    RowLayout{
        anchors.topMargin: 0
        anchors.leftMargin: 0

        ToggleButton{
            width:32; height: 32
            id: startStop
            onChanged: {
                text.text = isOn?"On":"Off"
            }
        }

        Text{
            id:text
            text:"Unk"
        }

        Button{
            text: "Turn On"
            onClicked: {
                startStop.setOn()
                isEnabled=1
            }
        }
        Button{
            text: "Turn Off"
            onClicked: {
                startStop.setOff()
                isEnabled=0
            }
        }
        Button{
            id:enButton
            text:"DoIt"
            icon.source:"images/action_stop.png"
            display:AbstractButton.IconOnly
            enabled:isEnabled
            onClicked: text.text="Donit"
        }
    }
}
