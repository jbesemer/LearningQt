import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Page {
    width: 600
    height: 400

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }
    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            width: 200
            Layout.maximumWidth: 400
            color: "lightblue"
            Text {
                text: "View 1"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: centerItem
            Layout.minimumWidth: 200
            Layout.fillWidth: true
            color: "lightgray"
            Text {
                text: "View 2"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            color: "lightgreen"
            Text {
                text: "View 3"
                anchors.centerIn: parent
            }
        }
    }
}
