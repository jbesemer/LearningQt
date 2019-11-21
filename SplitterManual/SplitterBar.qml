import QtQuick 2.0

Rectangle {
    // orientation: vertical means for vertical splitview,
    // which actually is a horizontal rectangle
    property int orientation:Qt.Vertical
    property int thickness: 5
    width: orientation===Qt.Vertical ? parent.width : thickness
    height: orientation===Qt.Vertical ? thickness : parent.height

    color:"lightgreen"

    Rectangle{
        implicitHeight: 4
        implicitWidth: 32
        anchors.centerIn: parent
        color: Qt.darker(parent.color, 3.0)
    }

    signal click()

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        onClicked: click()
    }
}
