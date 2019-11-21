import QtQuick 2.0

Rectangle {
    // orientation: vertical means for vertical splitview,
    // which actually is a horizontal rectangle
    property int orientation:Qt.Vertical
    property int thickness: 5
    width: orientation===Qt.Vertical ? parent.width : thickness
    height: orientation===Qt.Vertical ? thickness : parent.height

    MouseArea{
        id:mouseArea
        anchors.fill: parent
    }
}
