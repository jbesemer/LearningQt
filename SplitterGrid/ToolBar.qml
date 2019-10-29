import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

ColumnLayout{
    id:controls
    height:40

    property int isEnabled: 1

    function startZeroing(){
        errors.hide()
        controls.enabled=false
        zeroingTimer.start()
        messages.show( "Zeroing Meter" )
    }

    function finishZeroing(){
        var rand = Math.random()
        if( rand < 0.3){
            errors.show( "Zeroing error")
        }else{
            messages.hide()
            errors.hide()
            controls.enabled=true
        }
    }

    RowLayout{
        id:buttons
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
                startZeroing()
            }

            Timer {
                id: zeroingTimer
                property int seconds: 2
                interval: seconds * 1000
                running: false
                repeat: false
                onTriggered: finishZeroing()
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
}

