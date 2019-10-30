import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id:measurement
    color: "lightblue"
    Label {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight

        text:"3.254 mW"
        font.pixelSize: measurement.height*0.9
    }

    MouseArea{
        anchors.fill:parent
        onClicked: {
            console.log( "Clicked Measurement" )
        }
    }
}
