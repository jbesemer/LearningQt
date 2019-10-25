import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id:toolbar
    color: "grey"
    height:40
    Label {
        text: "Toolbar"
        anchors.centerIn: parent
    }

    MouseArea{
        anchors.fill:parent
        onClicked: {
            console.log( "Clicked Toolbar" )
        }
    }
}
