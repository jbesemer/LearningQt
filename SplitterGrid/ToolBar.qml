import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

ColumnLayout{
    id:controlsAndMessages
    height:40

    property int isEnabled: 1

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

            function start(){
                errors.hide()
                toolbar.enabled=false
                zeroingTimer.start()
                messages.show( "Zeroing Meter" )
            }

            function finish(){
                messages.hide()
                errors.hide()
                toolbar.enabled=true
            }

            onClicked:{
                start()
            }

            Timer {
                id: zeroingTimer
                property int seconds: 2
                interval: seconds * 1000
                running: false
                repeat: false
                onTriggered: {
                    var rand = Math.random()
                    if( rand < 0.3){
                        errors.show( "Zeroing error")
                    }else{
                        zeroingButton.finish()
                    }
                }
            }
        }

        ControlPanel {
            id: controlPanel
            Layout.fillWidth: true

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
        Layout.alignment: Qt.AlignHCenter

        visible: false

        function show( message ){
            messages.visible=true
            messageText.text=message
        }

        function hide(){
            messages.visible=false
        }

        Text{
            id:messageText
            color:"yellow"
            font.pointSize: 18
        }
    }

    RowLayout{
        id: errors
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

        visible: false

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
                zeroingButton.start()
            }
        }
        Button{
            text: "Cancel"
            onClicked: {
                zeroingButton.finish()
            }
        }
    }
}

