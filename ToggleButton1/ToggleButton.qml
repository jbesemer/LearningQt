import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    width:isOn ? imagePause.width : imagePlay.width
    height:isOn ? imagePause.height : imagePlay.height

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
      id:imagePause
      anchors.fill: parent;
      source:"images/action_pause.png"
      opacity: isOff()? 0: 1
    }
    Image {
      id:imagePlay
      anchors.fill: parent;
      source:"images/action_play.png"
      opacity: isOff()? 1: 0
    }

    MouseArea{
        id:region
        anchors.fill:parent
        onReleased: toggle()
    }
}
