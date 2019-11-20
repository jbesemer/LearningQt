import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Drawer{
        id:drawer
        width:window.width
        height:50
        edge: Qt.BottomEdge

        Label{
            text:"Content galore"
            anchors.centerIn: parent
        }

    }
}
