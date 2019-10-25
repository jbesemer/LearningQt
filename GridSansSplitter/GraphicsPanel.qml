import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id: lowerLeft
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
