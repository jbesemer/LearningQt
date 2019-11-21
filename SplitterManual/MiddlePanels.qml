import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

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
        SplitView.maximumWidth: 120
        color: "lightgray"
        implicitWidth: 100
        Label {
            id:label
            text: "middleRight"
            anchors.centerIn: parent
        }
        onWidthChanged: label.visible=width>20

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log( "Clicked middleRight" )
            }
        }
    }
}
