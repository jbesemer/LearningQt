import QtQuick 2.0

Rectangle {
    id:imageButton
    width:32
    height:32

    signal clicked()

    onEnabledChanged: console.log("enabled: ", enabled)

    property alias image: image

    Image {
      id:image
      anchors.fill: parent;
      source: "images/action_left.png"
      opacity: enabled ? 1.0 : 0.5
    }

    MouseArea{
        id:region
        anchors.fill:parent
        onClicked: {
            if(enabled){
                imageButton.clicked()
            }
        }
    }
}
