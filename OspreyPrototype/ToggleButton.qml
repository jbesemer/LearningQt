import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    id:toggleButton
    width:32
    height:32

    property alias image: image

    signal clicked(bool isRunning)
    signal changed(bool isRunning)

    function toggle(){ running = !running }

    property bool running: false
    onRunningChanged: {
        //console.log("ToggleButton.running: ", !running, "->", running)
        changed(running)
    }
    // onEnabledChanged:

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
