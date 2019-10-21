import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    //width:image.width
    //height:image.height

    signal clicked(int isOn)

    state: "off"

    function isOn(){ return state!="off" }
    function isOff(){ return state=="off" }
    function setOn(){ state="on"; return true }
    function setOff(){ state="off"; return false }
    function set(isOn){
        if(isOn) setOn();
        else    setOff();
    }
    function toggle(){ set(!isOn()) }

    Image {
      id:image
      anchors.fill: parent;
      source: isOff()
              ? "images/action_play.png"
              : "images/action_pause.png"
    }

    MouseArea{
        id:region
        anchors.fill:parent
        onReleased: {toggle();clicked(isOn())}
    }
}
