import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            implicitWidth: 200
            SplitView.maximumWidth: 400
            color: "lightblue"
            Label {
                text: "View 1"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: centerItem
            SplitView.minimumWidth: 50
            SplitView.fillWidth: true
            color: "lightgray"
            Label {
                text: "View 2"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            implicitWidth: 200
            color: "lightgreen"
            Label {
                text: "View 3"
                anchors.centerIn: parent
            }
        }
    }
}
