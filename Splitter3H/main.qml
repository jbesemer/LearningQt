import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    // 3. when handles are very close, items in the collapsed region
    //      overflow into adjacant region. Would prefer to have this cause
    //      collapsed region to be hidden.
    // 4. Can't find method to hook when handles move to implement #3.

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
