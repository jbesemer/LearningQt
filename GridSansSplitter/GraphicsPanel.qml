import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

// replaced by ScopeView

Rectangle {
    id: graphics
    color: "lightgray"
    Label {
        text: "Graphics Panel"
        anchors.centerIn: parent
    }
    onHeightChanged: console.log("heightChanging")

    MouseArea{
        anchors.fill:parent
        onClicked: {
            console.log( "Clicked Graphics Panel" )
        }
    }
}
