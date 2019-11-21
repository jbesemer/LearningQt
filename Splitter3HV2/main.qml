import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter3HV2")

    RowLayout{
        anchors.fill: parent

        MainPanels{
            anchors.fill: parent
        }
    }
}
