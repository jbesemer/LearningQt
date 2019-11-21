import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

SplitView {
    id:vertSplit
    orientation: Qt.Vertical

    handle:Rectangle{
        id:handleRect
        implicitHeight: 8
        //implicitWidth: 6
        SplitView.fillWidth: true
        color: SplitHandle.pressed ? "#81e889"
            : (SplitHandle.hovered
                ? Qt.lighter("#c2f4c6", 1.1)
                : "#c2f4c6")

        Rectangle{
            implicitHeight: 4
            implicitWidth: 32
            anchors.centerIn: parent
            color: Qt.darker("#c2f4c6", 3.0)
        }

        MouseArea{
            anchors.fill:parent
            propagateComposedEvents: true
            function getHandleIndex(handle){
                var items = parent.parent.children
                for(var i=0; i<items.length; i++ ){
                    console.log(items[i], items[i]===handleRect)

                    if(items[i]===handleRect){
                        return i
                    }
                }
            }
            function togglePanel(handleRect){
                var handleIndex=getHandleIndex(handleRect)
                console.log( "Clicked handle ", handleIndex)
                if(handleIndex==2){ // upper panel
                    if(upperPanel.height<upperPanel.implicitHeight){
                        upperPanel.height = upperPanel.implicitHeight
                    }else{
                        upperPanel.height=0
                    }
                }else if(handleIndex==4){ // lower panel
                    if(lowerPanel.height<lowerPanel.implicitHeight){
                        lowerPanel.height = lowerPanel.implicitHeight
                    }else{
                        lowerPanel.height=0
                    }
                }else
                    console.log("bad index")

            }

            onClicked: {
                togglePanel(handleRect)
            }
        }
    }

    Rectangle {
        id:upperPanel
        SplitView.fillWidth: true
        implicitHeight: 40
        color: "lightgreen"
        Label {
            text: "upperMenu"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log( "Clicked upperPanel" )
            }
        }
    }

    SplitView {
        id:middlePanel
        orientation: Qt.Horizontal
        SplitView.fillWidth: true
        SplitView.fillHeight: true
        //SplitView.minimumWidth: 50

        Rectangle {
            id:middleLeft
            color: "lightblue"
            SplitView.fillWidth: true
            Label {
                text: "middleLeft"
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill:parent
                onClicked: {
                    console.log( "Clicked middleLeft" )
                }
            }
        }

        Rectangle {
            id: middleRight
            color: "lightgray"
            implicitWidth: 100
            Label {
                text: "middleRight"
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill:parent
                onClicked: {
                    console.log( "Clicked middleRight" )
                }
            }
        }
    }

    Rectangle {
        id:lowerPanel
        SplitView.fillWidth: true
        implicitHeight: 40
        color: "lightgreen"
        Label {
            text: "View 3"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log( "Clicked lowerPanel" )
            }
        }
    }
}
