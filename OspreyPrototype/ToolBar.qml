import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.0

// ToolBar.qml

ColumnLayout{
    id:controls
    height:40

    function startZeroing(){
        errors.hide()
        controls.enabled=false
        meterModel.startZeroing()
        messages.show( "Zeroing Meter" )
    }
    function zeroingSucceeded(){
        messages.hide()
        errors.hide()
        controls.enabled=true
    }
    function zeroingFailed(){
        errors.show( "Zeroing error")
    }

    property MeterModel meterModel:MeterModel{
        onZeroingFailed: {
            console.log("zeroingFailed");
            controls.zeroingFailed()
        }
        onZeroingSucceeded: {
            console.log("zeroingSucceeded");
            controls.zeroingSucceeded()
        }
    }

    property int isEnabled: 1

    RowLayout{
        id:buttons
        Layout.fillWidth: true
        spacing: 4

        ImageButton{
            id:burgerButton
            image.source: "images/burger2.png"
            onClicked: burgerMenu.open()

            Menu{
                id:burgerMenu
                y:burgerButton.height
                MenuItem { text: "System Menu Item1" }
                MenuItem { text: "System Menu Item2" }
                MenuItem {
                    text: "Power Off"
                    onTriggered: Qt.quit()
                }
            }
        }

        Text {
            text: "Osprey"
            font.pointSize: 16
            color: "white"
        }

        ToggleButton{
            id:runPauseButton
            //height:parent.height
            //width: 40
            onChanged: {
                zeroingButton.enabled=!running
                scopeView.isRunning=running
                MeterModel.setRunning(running);
            }
        }

        ToggleButton{
            id: zeroingButton
            width:32; height: 32
            image.source:"images/download.png"

            onClicked:{
                startZeroing()
            }
        }

        ControlPanel {
            id: controlPanel

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

