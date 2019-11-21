import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 200
    height: 228
    title: qsTr("Drawer with Transform")

    Drawer{
        id: drawer
        width: 0.33*window.width
        height: window.height
        edge:Qt.LeftEdge
        dragMargin: 40

        Rectangle{
            color:"green"
            anchors.fill: parent
        }
    }

    Label {
          id: content

          text: "Aa"
          font.pixelSize: 96
          anchors.fill: parent
          verticalAlignment: Label.AlignVCenter
          horizontalAlignment: Label.AlignHCenter

          transform: Translate {
              x: drawer.position * content.width * 0.33
          }
      }
}
