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

    // 1. None of initial or Layout.minimum settings obeyed at startup
    //      layout has 2 handles squished all the way left and one huge View 3.
    //      user needs to manually reveal the hidden panels.
    //      Presumably, saving and restoring layout will remedy this.
    // 2. Layout.minimum and .maximum are not enforced during user interaction.
    //      handles can be freely moved to any position.
    // 3. when handles are very close, items in the collapsed region
    //      overflow into adjacant region. Would prefer to have this cause
    //      collapsed region to be hidden.
    // 4. Can't find method to hook when handles move to implement #3.

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            width: 200
            SplitView.minimumWidth: 50
            SplitView.maximumWidth: 400
            color: "lightblue"
            Text {
                text: "View 1"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: centerItem
            SplitView.minimumWidth: 50
            SplitView.fillWidth: true
            color: "lightgray"
            Text {
                text: "View 2"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            SplitView.minimumWidth: 50
            width: 200
            color: "lightgreen"
            Text {
                text: "View 3"
                anchors.centerIn: parent
            }
        }
    }
}
