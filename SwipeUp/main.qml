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
        id:drawerBottom
        width:window.width
        edge: Qt.BottomEdge
        height:50
        dragMargin: 50

        Rectangle{
            color:"green"
            anchors.fill: parent
            Text{
                text:"Content galore"
                color:"white"
                anchors.centerIn: parent
            }
       }
    }

    Drawer{
        id:drawer
        edge: Qt.TopEdge
        width:window.width
        height:50
        dragMargin: 50

        Rectangle{
            color:"blue"
            anchors.fill: parent
            Text{
                text:"Content galore"
                color:"white"
                anchors.centerIn: parent
            }
        }
    }
}
