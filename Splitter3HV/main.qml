import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter3HV")

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        SplitView {
            orientation: Qt.Vertical
            SplitView.fillWidth: true
            //SplitView.minimumWidth: 50

            Rectangle {
                id:upperLeft
                color: "lightblue"
                implicitHeight: 50
                Label {
                    text: "View 1"
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        console.log( "Clicked upperLeft" )
                    }
                }
            }
            Rectangle {
                id: lowerLeft
                SplitView.fillHeight: true
                color: "lightgray"
                Label {
                    text: "View 2"
                    anchors.centerIn: parent
                }
                onHeightChanged: console.log("heightChanging")

                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        console.log( "Clicked lowerLeft" )
                    }
                }
            }
        }

        Rectangle {
            id:rightPanel
            SplitView.minimumWidth: 50
            implicitWidth: 200
            color: "lightgreen"
            Label {
                text: "View 3"
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill:parent
                onClicked: {
                    console.log( "Clicked rightPanel" )
                }
            }
        }
    }
}
