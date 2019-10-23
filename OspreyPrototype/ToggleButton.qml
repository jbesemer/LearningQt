import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    id:toggleButton
    width:32
    height:32

    signal clicked(bool isRunning)
    signal changed(bool isRunning)

    property bool running:false
    onRunningChanged:changed(running)
    onEnabledChanged: console.log("enabled: ", enabled)

    property alias image: image

    function isRunning(){ return running }
    function isPaused(){ return !running }
    function setRunning(isRunning){
        running=isRunning
        changed(running)
    }
    function toggle(){
        setRunning(!running)
    }

    Image {
      id:image
      anchors.fill: parent;
      source: running
              ? "images/action_pause.png"
              : "images/action_play.png"
      opacity: enabled ? 1.0 : 0.5
    }

    MouseArea{
        id:region
        anchors.fill:parent
        onClicked: {
            if(enabled){
                toggle()
                toggleButton.clicked(running)
            }
        }
        onPressed: {}
        onPressAndHold: {}
        onReleased: {}
    }
}
