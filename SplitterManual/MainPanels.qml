import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Column{
    id:vertSplit
    anchors.fill: parent
    //orientation: Qt.Vertical

    property int upperPanelHeight: 60
    property int lowerPanelHeight: 60

    Rectangle {
        id:upperPanel
        width:parent.width
        implicitHeight: upperPanelHeight
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
            onDoubleClicked: {
                upperSplitter.toggle()
            }
        }
    }

    SplitterBar{
        id: upperSplitter
        isUp:true
        onToggled:{
            upperPanel.visible=!upperPanel.visible
        }
    }

    MiddlePanels {
        id:middlePanel
        width:parent.width
        height:parent.height
               - upperSplitter.height
               - ( upperPanel.visible ? upperPanel.height : 0 )
               - ( lowerPanel.visible ? lowerPanel.height : 0 )
               - lowerSplitter.height
    }

    SplitterBar{
        id: lowerSplitter
        onToggled:{
            lowerPanel.visible=!lowerPanel.visible
        }
    }

    Rectangle {
        id:lowerPanel
        //SplitView.fillWidth: true
        width:parent.width
        implicitHeight: lowerPanelHeight
        color: "lightgreen"
        Label {
            text: "lowerPanel"
            anchors.centerIn: parent
        }

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log( "Clicked lowerPanel" )
            }
            onDoubleClicked: {
                lowerSplitter.toggle()
            }
        }
    }
}
