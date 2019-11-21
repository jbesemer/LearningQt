import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Swipe Pages")

    SwipeView{
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item{
            id: page1
            Rectangle{
                color:"red"
                anchors.fill:parent
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Page 1"
            }
            }
        }

        Item{
            id: page2
            Rectangle{
                color:"green"
                anchors.fill:parent
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Page 2" }
            }
        }

        Item{
            id: page3
            Rectangle{
                color:"blue"
                anchors.fill:parent
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Page 3" }
            }
        }

        Item{
            id: page4
            Rectangle{
                color:"violet"
                anchors.fill:parent
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Page 4" }
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
