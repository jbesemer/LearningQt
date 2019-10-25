import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter Grid")
    color: "black"

    ColumnLayout{
        anchors.fill:parent

        ToolBar{
            Layout.fillWidth: true
        }

        SplitView {
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.fillHeight: true

            SplitView {
                orientation: Qt.Vertical
                SplitView.fillWidth: true

                MeasurementPanel{
                    //Layout.row:1
                    //Layout.column: 0
                    Layout.fillWidth: true
                    height:30
                }

                ScopeView{
                    //Layout.row:2
                    //Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            StatisticsPanel{
                //Layout.row:1
                //Layout.column: 1
                //Layout.rowSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumWidth: 100
            }
        }

        Rectangle{
            id: statusBar
            Layout.fillWidth: true
            height:20
            Text{
                anchors.centerIn: parent
                text: "Status Bar: Situation Normal"
            }
        }
    }
}
