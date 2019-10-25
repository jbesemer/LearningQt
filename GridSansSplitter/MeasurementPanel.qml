import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id:upperLeft
    color: "lightblue"
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
