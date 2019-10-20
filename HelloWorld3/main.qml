import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Extras 1.4

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Hello World"

    Rectangle {
        id: rectangle
        x: 219
        y: 131
        width: 202
        height: 67
        color: "#a1c4fd"
        gradient: Gradient {
             GradientStop {
                 position: 0
                 color: "#a1c4fd"
             }

             GradientStop {
                 position: 1
                 color: "#c2e9fb"
             }
        }

        Column{
            anchors.centerIn: parent
            Text {
                anchors.horizontalCenter: parent.Center
                font.italic: true
                font.pointSize: 8
                text: "Label"
            }
            Text {
                anchors.horizontalCenter: parent.Center
                font.pointSize: 12
                text: "Value"
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked:{
                Qt.quit();
            }
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    ToggleButton {
        id: toggleButton
        x: 81
        y: 233
        text: qsTr("Button")
    }
}
