import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    width:40
    height:40

    state: "off"

    function toggle(){
        isOn = isOn ? false : true;
    }

    Image {
      anchors.fill: parent;
      source:"images/action_pause.png"
      opacity: state=="off"? 0: 1
    }
    Image {
      anchors.fill: parent;
      source:"images/action_play.png"
      opacity: state=="off"? 1: 0
    }

    MouseArea{
        id:region
        anchors.fill:parent
        onReleased: toggle()
    }
}
