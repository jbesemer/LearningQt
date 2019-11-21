import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    title: qsTr("Drawers with Transform")
    visible: true

    property int nominalWidth:600
    property int nominalHeight:400
    width: nominalWidth
    height: nominalHeight

    // non-resizable
    maximumWidth: nominalWidth
    minimumWidth: nominalWidth
    maximumHeight: nominalHeight
    minimumHeight: nominalHeight


    Rectangle{
        id: content
        anchors.fill: parent
        color: "yellow"
        transform: [Translate {
            y: -bottomDrawer.position * content.height * 0.33
            + topDrawer.position* content.height * 0.33
        },
        Scale{
            yScale: 1 - topDrawer.position*0.33
        }]

        Label {
              id: label
              text: "Aa"
              font.pixelSize: 96
              verticalAlignment: Label.AlignVCenter
              horizontalAlignment: Label.AlignHCenter
              anchors.centerIn: parent
        }
    }

    Drawer{
        id: leftDrawer
        width: 0.2*window.width
        height: nominalHeight //window.height
        edge:Qt.LeftEdge
        dragMargin: 40

        Rectangle{
            color:"green"
            anchors.fill: parent
            Text{
                text:"No Transform"
                color:"white"
                anchors.centerIn: parent
                rotation:+90
            }
        }
    }

    Drawer{
        id: topDrawer
        width: nominalWidth // window.width
        height: 0.33*window.height
        edge: Qt.TopEdge
        dragMargin: 40

        Rectangle{
            color:"green"
            anchors.fill: parent
            Text{
                text:"Scaling Transform"
                color:"white"
                anchors.centerIn: parent
            }
        }
    }

    Drawer{
        id: bottomDrawer
        width: nominalWidth // window.width
        height: 0.33*window.height
        edge:Qt.BottomToolBarArea
        dragMargin: 40

        Rectangle{
            color:"green"
            anchors.fill: parent
            Text{
                text:"Translation Transform"
                color:"white"
                anchors.centerIn: parent
            }
        }
    }

    Drawer{
        id: rightDrawer
        width: 0.2*window.width
        height: nominalHeight //window.height
        edge:Qt.RightEdge
        dragMargin: 40

        Rectangle{
            color:"green"
            anchors.fill: parent
            Text{
                text:"No Transform"
                color:"white"
                anchors.centerIn: parent
                rotation:-90
            }
        }
    }
}
