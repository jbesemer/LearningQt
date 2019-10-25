import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter3HVG")

    GridLayout {
        anchors.fill:parent
        rows:3

        Rectangle{
            Layout.row:0
            color:"blue"
            height: 20
            Label {
                text: "ToolBar"
                anchors.centerIn: parent
            }
        }

        Rectangle{
            Layout.row:1
            color:"red"
            height: 20
            visible: false
            Label {
                text: "Messages"
                anchors.centerIn: parent
            }
        }

        MainPanels{
            Layout.row:2

        }
    }
}
