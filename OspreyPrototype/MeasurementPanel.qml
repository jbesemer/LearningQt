import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Rectangle {
    id:measurement
    color: "lightblue"

    RowLayout{
        anchors.fill:parent

        Text {
            id: value
            anchors.right:units.left
            anchors.bottom:parent.bottom
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignRight

            text: meterModel.connected?"3.254":"-.--"
            font.pixelSize: measurement.height*0.9
        }
        Text {
            id:units
            anchors.right:parent.right
            anchors.bottom:parent.bottom
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignRight

            text:" " + meterModel.connected?"mW":"W"
            font.pixelSize: measurement.height*0.6
        }
    }
    MouseArea{
        anchors.fill:parent
        onClicked: {
            console.log( "Clicked Measurement" )
        }
    }
}
