import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Column {
    id:vertSplit
    anchors.fill: parent
    //orientation: Qt.Vertical

    Rectangle {
        id:upperPanel
        width:parent.width
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

    SplitterBar{
        id: upperSplitter
        onClick:{
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
        onClick:{
            lowerPanel.visible=!lowerPanel.visible
        }
    }

    Rectangle {
        id:lowerPanel
        //SplitView.fillWidth: true
        width:parent.width
        implicitHeight: 40
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
        }
    }
}
