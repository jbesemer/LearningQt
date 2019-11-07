import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Osprey Prototype")
    color: "black"

    property alias scopeView: mainPanel.scopeView

    property MeterModel meterModel: MeterModel {
        onZeroingFailed: toolBar.zeroingFailed()
        onZeroingSucceeded: toolBar.zeroingSucceeded()
        onUpdateChart: scopeView.updateChart()
        onStarted: toolBar.startRunning()
        onStopped: toolBar.stopRunning()
    }

    ColumnLayout{
        id:mainPanel
        anchors.fill:parent
        //onHeightChanged: console.log("Main height: ", height )
        //onWidthChanged: console.log("Main width: ", width)

        property alias scopeView: hSplit.scopeView

        ToolBar{
            id:toolBar
            implicitWidth:window.width
            //onWidthChanged: console.log("toolbar width: ", width)
        }

        RowLayout{
            id: messages
            visible: false
            implicitWidth:window.width
            Layout.alignment: Qt.AlignHCenter

            function show( message ){
                messages.visible=true
                messageText.text=message
            }

            function hide(){
                messages.visible=false
            }

            //BusyIndicator{ padding:10 }

            Text{
                id:messageText
                color:"yellow"
                font.pointSize: 18
            }

            //BusyIndicator{ padding:10 }
        }

        // TODO: consolidate messages and errors, with more elaborate
        // calling methods for changing colors, buttons text and actions.
        // better yet: functionality should be in C++ with arms-distance
        // signals and method calls interface.
        RowLayout{
            id: errors
            visible: false
            implicitWidth:window.width
            Layout.alignment: Qt.AlignHCenter

            function show( message ){
                errors.visible=true
                messages.visible=false
                errorText.text=message
            }

            function hide(){
                errors.visible=false
                messages.visible=false
            }

            Text{
                id:errorText
                color:"red"
                font.pointSize: 18
            }
            Button{
                text: "Block Sensor And Retry"
                onClicked: {
                    toolBar.startZeroing()
                }
            }
            Button{
                text: "Cancel"
                onClicked: {
                    meterModel.zeroingSucceeded()
                }
            }
        }

        SplitView {
            id: hSplit
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitWidth:window.width-statistics.implicitWidth
            //onHeightChanged: console.log("hSplit height: ", height )
            //onWidthChanged: console.log("hSplit width: ", width)

            property alias scopeView: vSplit.scopeView
            SplitView {
                id:vSplit
                orientation: Qt.Vertical
                implicitWidth: 420
                //SplitView.fillWidth: true
                //onHeightChanged: console.log("vSplit height: ", height )
                //onWidthChanged: console.log("vSplit width: ", width)

                MeasurementPanel{
                    //id:measurement
                    Layout.fillWidth: true
                    implicitHeight: 80
                    //onHeightChanged: console.log("measure height: ", height )
                    //onWidthChanged: console.log("measure width: ", width)
                }

                property alias scopeView: graphicsPanel.scopeView
                GraphicsPanel{
                    id:graphicsPanel
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            StatisticsPanel{
                id:statistics
                Layout.fillHeight: true
                Layout.fillWidth: true
                implicitWidth: 100
                //onHeightChanged: console.log("stats height: ", height )
                //onWidthChanged: console.log("stats width: ", width)
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
