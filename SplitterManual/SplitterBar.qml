import QtQuick 2.0

Rectangle {
    // orientation: vertical means for vertical splitview,
    // which actually is a horizontal rectangle
    property int orientation:Qt.Vertical
    property int thickness: 9
    width: orientation===Qt.Vertical ? parent.width : thickness
    height: orientation===Qt.Vertical ? thickness : parent.height

    color:"lightgrey"

    Image{
        height: thickness-2
        width: 32
        anchors.centerIn: parent
        source:isUp?"action_up.png":"action_down.png"
    }

    property bool isUp:false

    signal toggled(bool isUp)

    function toggle(){
        isUp=!isUp
        toggled(isUp)
    }

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        onClicked: { console.log("Clicked"); toggle() }
        // need doubleClicked event but only to suppress second click
        // (of double-clicks). the first click does all the work.
        onDoubleClicked: { console.log("DoubleClicked") } //; toggle() }
    }
}
