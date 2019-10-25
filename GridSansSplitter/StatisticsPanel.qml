import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id:rightPanel
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
