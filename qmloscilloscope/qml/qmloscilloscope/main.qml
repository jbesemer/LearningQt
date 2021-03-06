import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: main
    visible: true
    width: 600
    height: 400

    property int isEnabled: 1
    RowLayout{
        id:toolbar
        anchors.topMargin: 0
        anchors.leftMargin: 0
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
                zeroingPopup.open()
            }

            Timer {
                id: zeroingTimer
                property int seconds: 4
                interval: seconds * 1000
                running: false
                repeat: false
                onTriggered: {
                    zeroingPopup.close()
                    toolbar.enabled=true
                }
            }
            Popup {
                id:zeroingPopup
                padding:4
                contentItem:Text{
                    font.pointSize: 18
                    text:"Zeroing Meter"
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

//![2]
    ScopeView {
        id: scopeView
        anchors.top: toolbar.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        height: main.height-toolbar.height

        onOpenGLSupportedChanged: {
            if (!openGLSupported) {
                controlPanel.openGLButton.enabled = false
                controlPanel.openGLButton.currentSelection = 0
            }
        }
    }
//![2]

}
