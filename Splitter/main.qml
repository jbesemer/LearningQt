import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SplitView {
        anchors.fill:parent
        orientation: Qt.Horizontal

        SplitView {
            id: leftPanel
            orientation: Qt.Vertical
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.minimumWidth: 20

            Rectangle {
                id: upperLeft
                width: 320
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                color: "lightblue"
                Text {
                    text: "View Upper Left"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: lowerLeft
                width: 320
                Layout.minimumHeight: 20
                Layout.fillWidth: true
                color: "lightgray"
                Text {
                    text: "View Lower Left"
                    anchors.centerIn: parent
                }
            }
        }

        Rectangle {
            id: rightPanel
            width: 320
            Layout.fillHeight: true
            Layout.minimumWidth: 20
            color: "lightgreen"
            Text {
                text: "View Right"
                anchors.centerIn: parent
            }
        }
    }
}
