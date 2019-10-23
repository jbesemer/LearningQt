import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: main
    visible: true
    width: 640
    height: 480

    property int isEnabled: 1

    ColumnLayout{
        anchors.fill:parent

        RowLayout{
            id:toolbar
            Layout.fillWidth: true
            spacing: 4

            Text {
                text: "Osprey"
                font.pointSize: 16
                color: "white"
            }

            ToggleButton{
                //height:parent.height
                //width: 40
                onChanged: {
                    zeroingButton.enabled=!running
                    scopeView.isRunning=running
                }
            }

            ToggleButton{
                id: zeroingButton
                width:32; height: 32
                image.source:"images/download.png"

                onClicked:{
                    toolbar.enabled=false
                    zeroingTimer.start()
                    messages.show( "Zeroing Meter" )
                }

                Timer {
                    id: zeroingTimer
                    property int seconds: 4
                    interval: seconds * 1000
                    running: false
                    repeat: false
                    onTriggered: {
                        messages.hide()
                        toolbar.enabled=true
                    }
                }
            }

            ControlPanel {
                id: controlPanel
        //![1]
                function sourceNameToId(source){
                    if (source === "sine")return 0;
                    else if (source === "square")return 1;
                    else if (source === "pulse")return 2;
                    else
                        return 3;
                }

                property int currentSourceId: 0;
                property double currentAcquisitionRate: 0;

                onSignalSourceChanged: {
                    currentSourceId = sourceNameToId(source);
                    currentAcquisitionRate=acquisitionRate;
                    dataSource.changeAcquisitionRate(currentAcquisitionRate);
                    dataSource.generateData(currentSourceId, 6, sampleCount );
                    scopeView.axisX().max = sampleCount;
                }
                onSeriesTypeChanged: scopeView.changeSeriesType(type);
                onRefreshRateChanged: scopeView.changeRefreshRate(rate);
                onAntialiasingEnabled: scopeView.antialiasing = enabled;
                onOpenGlChanged: {
                    scopeView.openGL = enabled;
                }
            }
        }

        RowLayout{
            id: messages
            Layout.fillWidth: true
            visible: false

            function show( message ){
                messages.visible=true
                text.text=message
            }

            function hide(){
                messages.visible=false
            }

            Text{
                id:text
                color:"yellow"
                font.pointSize: 18
            }
        }

        ScopeView {
            id: scopeView
            Layout.fillWidth: true
            Layout.fillHeight: true

            onOpenGLSupportedChanged: {
                if (!openGLSupported) {
                    controlPanel.openGLButton.enabled = false
                    controlPanel.openGLButton.currentSelection = 0
                }
            }
        }
    }
}
