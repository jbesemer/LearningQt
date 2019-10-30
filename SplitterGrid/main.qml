import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Splitter Grid")
    color: "black"

    ColumnLayout{
        id:main
        anchors.fill:parent
        onHeightChanged: console.log("Main height: ", height )
        onWidthChanged: console.log("Main width: ", width)

        ToolBar{
            id:toolBar
            implicitWidth:window.width
            onWidthChanged: console.log("toolbar width: ", width)
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

            BusyIndicator{
            }

            Text{
                id:messageText
                color:"yellow"
                font.pointSize: 18
            }

            BusyIndicator{
            }
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
                    toolBar.finishZeroing()
                }
            }
        }

        SplitView {
            id: hSplit
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitWidth:window.width-statistics.implicitWidth
            onHeightChanged: console.log("hSplit height: ", height )
            onWidthChanged: console.log("hSplit width: ", width)

            SplitView {
                id:vSplit
                orientation: Qt.Vertical
                implicitWidth: 420
                //SplitView.fillWidth: true
                onHeightChanged: console.log("vSplit height: ", height )
                onWidthChanged: console.log("vSplit width: ", width)

                MeasurementPanel{
                    id:measurement
                    //Layout.row:1
                    //Layout.column: 0
                    Layout.fillWidth: true
                    implicitHeight: 80
                    onHeightChanged: console.log("measure height: ", height )
                    onWidthChanged: console.log("measure width: ", width)
                }

                ScopeView{
                    id:scopeView
                    //Layout.row:2
                    //Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onHeightChanged: console.log("scope height: ", height )
                    onWidthChanged: console.log("scope width: ", width)
                }
            }

            StatisticsPanel{
                id:statistics
                //Layout.row:1
                //Layout.column: 1
                //Layout.rowSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                implicitWidth: 100
                //Layout.preferredWidth: 220
                onHeightChanged: console.log("stats height: ", height )
                onWidthChanged: console.log("stats width: ", width)
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
