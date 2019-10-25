import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    // doesn't work at all

    GridLayout{
        rows:3
        columns: 2
        anchors.fill:parent

        ToolBar{
            Layout.row:0
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        MeasurementPanel{
            Layout.row:1
            Layout.column: 0
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        GraphicsPanel{
            Layout.row:2
            Layout.column: 0
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        StatisticsPanel{
            Layout.row:1
            Layout.column: 1
            Layout.rowSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
