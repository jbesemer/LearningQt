import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Swipe Drawer and Pages")

    Drawer{
        id:drawer
        edge: Qt.TopEdge
        width:window.width
        height:100
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

    SwipeView{
        id: view
        currentIndex: 0
        width:window.width
        height:window.height - drawer.height * drawer.position
        y:drawer.height * drawer.position

        Item{
            id: page1
            Rectangle{
                color:"white"
                anchors.fill:parent
                border.width:6
                border.color:"red"
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Page 1"
                }
            }
        }

        Item{
            id: page2
            Rectangle{
                color:"white"
                anchors.fill:parent
                border.width:6
                border.color:"green"
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Page 2"
                }
            }
        }

        Item{
            id: page3
            Rectangle{
                color:"white"
                anchors.fill:parent
                border.width:6
                border.color:"blue"
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Page 3"
                }
            }
        }

        Item{
            id: page4
            Rectangle{
                color:"white"
                anchors.fill:parent
                border.width:6
                border.color:"violet"
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Page 4"
                }
            }
        }
    }

    PageIndicator{
        id:indicator

        count:view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
