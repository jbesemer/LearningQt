import QtQuick 2.6

Rectangle {
    width: 400
    height: 400

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Text{
        anchors.centerIn: parent
        text:"HelloWorld"
    }
}
