import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter3HVG")

    // nesting breaks layout: https://bugreports.qt.io/browse/QTBUG-60489

    GridLayout {
        anchors.fill:parent
        rows:3

        Rectangle{
            Layout.row:0
            Layout.fillWidth: true
            color:"blue"
            height: 20
            Label {
                text: "ToolBar"
                anchors.centerIn: parent
            }
        }

        Rectangle{
            Layout.row:1
            Layout.fillWidth: true
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
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
